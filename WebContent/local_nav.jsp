<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          DTAs
        </a>
        <div class="dropdown-menu" aria-haspopup="true" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="<util:applicationRoot/>/dta_dashboard.jsp?view=executed">Executed</a>
         <a class="dropdown-item" href="<util:applicationRoot/>/dta_dashboard.jsp?view=pending">Pending</a>
         <a class="dropdown-item" href="<util:applicationRoot/>/dta_dashboard.jsp?view=detail">Details</a>
        </div>
      </li>

      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          IRB Protocols
        </a>
        <div class="dropdown-menu" aria-haspopup="true" aria-labelledby="navbarDropdownMenuLink">
        </div>
      </li>

      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          DUAs
        </a>
        <div class="dropdown-menu" aria-haspopup="true" aria-labelledby="navbarDropdownMenuLink">
        </div>
      </li>

      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Mapping
        </a>
        <div class="dropdown-menu" aria-haspopup="true" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="<util:applicationRoot/>/mapping/mapper_ncats.jsp">to NCATS</a>
          <a class="dropdown-item" href="<util:applicationRoot/>/mapping/mapper_irb.jsp">to sIRB</a>
         </div>
      </li>
      