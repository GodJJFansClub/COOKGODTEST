<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>

</head>
<body>
		<aside class="left-sidebar" data-sidebarbg="skin5">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                    
                     <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="<%=request.getContextPath()%>/back-end/dishFood/select_page.jsp"  aria-expanded="false">
                                <i class="mdi mdi-arrange-bring-forward"></i>
                                <span class="hide-menu">食材管理</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="<%=request.getContextPath()%>/back-end/dishFood/listAllDishFood.jsp" aria-expanded="false">
                                <i class="mdi mdi-av-timer"></i>
                                <span class="hide-menu">查詢全部食材</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="<%=request.getContextPath()%>/back-end/dishFood/addDishFood.jsp" aria-expanded="false" aria-expanded="false">
                                <i class="mdi mdi-account-network"></i>
                                <span class="hide-menu">新增食材查詢</span>
                            </a>
                        </li>
                        
                        
                    </ul>
                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </aside>
    
</body>
</html>