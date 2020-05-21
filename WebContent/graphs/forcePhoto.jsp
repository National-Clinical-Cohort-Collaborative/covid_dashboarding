<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<style>
.node {
	stroke: #fff;
	stroke-width: 1.5px;
}

.link {
	stroke: #7b7d82;
}
</style>


<script src="https://d3js.org/d3.v3.min.js"></script>
<script>

var width = parseInt(d3.select("#content").style("width")),
	height = width-80,
    radius = 30,
    charge = -100,
    linkDistance = 500;

<c:if test="${not empty param.charge}">
	charge = ${param.charge};
</c:if>
<c:if test="${not empty param.ld}">
	linkDistance = ${param.ld};
</c:if>

var color = d3.scale.category10().domain(d3.range(0,9));

var force = d3.layout.force()
    .charge(-350)
    .chargeDistance(500)
    .linkDistance(70)
    .linkStrength(0.8)
    .gravity(0.05)
    .size([width, height]);

var svg = d3.select("#graph").append("svg")
	.attr("xmlns","http://www.w3.org/2000/svg")
    .attr("width", width)
    .attr("height", height);

var graph = null;

d3.select(window).on('resize', function() {
	})

	d3.json("${param.data_page}", function(error, new_graph) {
		graph = new_graph;
  force
      .nodes(graph.nodes)
      .links(graph.links)
      .start();
 
	var rScale = d3.scale.linear()
	 .domain([0, d3.max(graph.nodes, function(d) { return d.score; })])
	 .range([3, 500]);

	var eScale = d3.scale.linear()
	 .domain([0, d3.max(graph.links, function(d) { return d.value; })])
	 .range([1, 3]);

  // need to do color instead of opacity based on link weight 
  var link = svg.selectAll(".link")
      .data(graph.links)
    .enter().append("line")
      .attr("class", "link")
      .style("stroke-width", function(d) { return eScale(d.value); });

  var node = svg.selectAll(".node")
    .data(graph.nodes)
    .enter().append("g")
    .attr("class", "node")
	.on("dblclick", function(d) { window.open(d.url,"_self");})
    .on("mouseover.image", get_big)
    .on("mouseout.image", get_small)
    .on("mouseover.node", fade(0.15))
    .on("mouseout.node", fade(1))
    .call(force.drag);
  
  node.append("image")
	.attr("xlink:href",  function(d) { return d.image_link;})
	.attr("x", function(d) { return -(size(d)/2);})
	.attr("y", function(d) { return -(size(d)/2);})
	.attr("height", size)
	.attr("width", size);
  
  function size(d){
	  if(d.group==3){return 40;} 
	  if(d.group==2){return 20;} 
	  if(d.group==1){return 50;}
  }
  
	
  node.append("title")
      .text(function(d) { return d.name; });
  

  force.on("tick", function() {
    link.attr("x1", function(d) { return d.source.x; })
        .attr("y1", function(d) { return d.source.y; })
        .attr("x2", function(d) { return d.target.x; })
        .attr("y2", function(d) { return d.target.y; });

    node.attr("transform", function(d) {return "translate(" + d.x + "," + d.y + ")";})
	    .attr("d", d3.svg.symbol()
			.size(function(d) {return rScale(d.score);})
	        .type(function(d) { return updateType(d); }))
		.style("fill", function(d) {return updateStyle(d);});
  });

  function get_big(d) {
	  if(d.group==3){
		  d3.select(this).select("image").transition()
		     .attr("x", function(d) { return -(100/2);})
			 .attr("y", function(d) { return -(100/2);})
			 .attr("height", 100)
			 .attr("width", 100);
		  };
	}
  
  function get_small(d){
	  d3.select(this).select("image").transition()
	     .attr("x", function(d) { return -(size(d)/2);})
		 .attr("y", function(d) { return -(size(d)/2);})
		 .attr("height", size)
		 .attr("width", size);
  }
  
  var linkedByIndex = {};
  graph.links.forEach(function(d) {
      linkedByIndex[d.source.index + "," + d.target.index] = 1;
  });

  function isConnected(a, b) {
      return linkedByIndex[a.index + "," + b.index] || linkedByIndex[b.index + "," + a.index] || a.index == b.index;
  }


	
function fade(opacity) {
    return function(d) {
        node.style("opacity", function(o) {
            thisOpacity = isConnected(d, o) ? 1 : opacity;
            this.setAttribute('opacity', thisOpacity);
            return thisOpacity;
        });

        link.style("stroke-opacity", function(o) {
            return o.source === d || o.target === d ? 1 : opacity;
        });
    };
}
});

function updateData() {
	var alg = document.querySelector('input[name="detectionAlg"]:checked').value;
	if(alg=="site") { drawColorKey2(graph.sites); }
	else { d3.select("#legend").remove(); }
	force.start(); }

function updateStyle(d) {
	  return color(d.group % 10);	
}

function updateType(d) {
	return d3.svg.symbolTypes[d.group/10>>0];
}


</script>
