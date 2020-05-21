<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="${param.repo}">
<svg width="100" height="20"></svg>
<script src="https://d3js.org/d3.v4.min.js"></script>
<script>
//
// this was derived from https://bl.ocks.org/Andrew-Reid/0aedd5f3fb8b099e3e10690bd38bd458
//
// I hung on to much of the logic so we could opt for either a single undecorated stacked bar (for the CD2H dashboard), or something more complex with axes
// This still loads the data.csv file, as I was just hacking this to work as quickly as possible
// We'll need to remove that logic when we have a chance

var svg = d3.select("#${param.repo}").select("svg"),
    margin = {top: 2, right: 2, bottom: 2, left: 2},
    <c:if test="${not empty param.axes}">
    margin = {top: 20, right: 20, bottom: 30, left: 40},
    </c:if>
    width = +svg.attr("width") - margin.left - margin.right,
    height = +svg.attr("height") - margin.top - margin.bottom,
    g = svg.append("g").attr("transform", "translate(" + margin.left + "," + margin.top + ")");

var y = d3.scaleBand()
    .rangeRound([0, height])
    ;

var x = d3.scaleLinear()
    .rangeRound([0, width]);

var z = d3.scaleOrdinal()
    .range(["green", "tan", "#7b6888", "#6b486b", "#a05d56", "#d0743c", "#ff8c00"]);

var xdata = d3.csvParse("label,y,z\na,${param.csv}", function(d, i, columns) {
	  for (i = 1, t = 0; i < columns.length; ++i) t += d[columns[i]] = +d[columns[i]];
	  d.total = t;
	  return d;
	});

d3.csv("../graphs/data.csv", function(d, i, columns) {
  for (i = 1, t = 0; i < columns.length; ++i) t += d[columns[i]] = +d[columns[i]];
  d.total = t;
  return d;
}, function(error, data) {
  if (error) throw error;

  var keys = xdata.columns.slice(1);

  y.domain(xdata.map(function(d) { return d.label; }));
  x.domain([0, d3.max(xdata, function(d) { return d.total; })]);
  z.domain(keys);

  g.append("g")
    .selectAll("g")
    .data(d3.stack().keys(keys)(xdata))
    .enter().append("g")
      .attr("fill", function(d) { return z(d.key); })
    .selectAll("rect")
    .data(function(d) { return d; })
    .enter().append("rect")
      .attr("y", function(d) { return y(d.data.label); })
      .attr("x", function(d) { return x(d[0]); })
      .attr("width", function(d) { return x(d[1]) - x(d[0]); })
      .attr("height", y.bandwidth());

  <c:if test="${not empty param.axes}">
	g.append("g")
	  .attr("class", "axis")
	  .attr("transform", "translate(0,0)")
	  .call(d3.axisLeft(y));

	g.append("g")
	  .attr("class", "axis")
	  .attr("transform", "translate(0,"+height+")")
	  .call(d3.axisBottom(x).ticks(null, "s"));
  </c:if>
});

</script>
</div>
