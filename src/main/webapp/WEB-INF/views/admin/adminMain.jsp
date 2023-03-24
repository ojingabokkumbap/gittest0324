<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
<%@ include file="/WEB-INF/views/include/adminLeft.jsp" %>
<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/css/bootstrap-extended.min.css">
<link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/fonts/simple-line-icons/style.min.css">
<link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/css/colors.min.css">
<link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
<style>
main{
  margin-top: 85px;
  padding: 2rem 1.5rem;
  background: #f1f5f9;
  min-height: calc(100vh - 90px);
}
.cards{
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  grid-gap: 2rem;
  margin-top: 1rem;
  
  
  
}
.card-single{
  display: flex;
  justify-content: space-between;
  background: #fff;
  padding: 2rem;
  border-radius: 12px;
   box-shadow: 0 5px 10px rgba(154,160,185,.05), 0 15px 40px rgba(166,173,201,.2);
}
.card-single div:last-child span{
  color: var(--main-color);
  font-size: 3rem;

}
.card-single div:first-child span{
  color: var(--text-grey);
  

}
.card-single:last-child{
  background: #6b9eba;
}
.card-single:last-child h1,
.card-single:last-child div:first-child span,
.card-single:last-child div:last-child span
{
  color: #fff;
}

.recent-grid{
  margin-top: 3.5rem;
  display: grid;
  grid-gap: 2rem;
  grid-template-columns: 65% auto;
 
}
.card{
  background: #fff;
  border-radius: 12px;
   box-shadow: 0 5px 10px rgba(154,160,185,.05), 0 15px 40px rgba(166,173,201,.2);
  padding: 1rem;
}
.card-header
{
  padding: 1rem;
}
.card-header{
  display: flex;
  justify-content: space-between;
  align-items: center;
  border-bottom: 1px solid #f0f0f0;
}
.card-header button{
  background: var(--main-color);
  border-radius: 10px;
  color: #fff;
  font-size: .8rem;
  padding: .5rem 1rem;
  border:1px solid var(--main-color);
}
table{
  border-collapse: collapse;
}
thead tr{
  border-top: 1px solid #f0f0f0;
  border-bottom:2px solid #f0f0f0;

}
thead td{
  font-weight: 700;
}
td{
  padding: .5rem 1rem ;
  font-size: .9rem ;
  color: #222;
  
}

tr td:last-child{
  display: flex;
  align-items: center;


}
td .status{
  display: inline-block;
  height: 10px;
  width: 10px;
  border-radius: 50%;
  margin-right: 1rem; 
}
.status.purple {
  background: rebeccapurple;
}
.status.pink{
  background: deeppink;
}
.status.orange{
  background: orangered;
}
.table-responsive{
  width: 100%;
  overflow-x: auto;
}
.customer{
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: .5rem .7rem;
}
.info{
  display: flex;
  align-items: center;
}
.info img{
  border-radius: 50%;
  margin-right: 1rem;
}
.info h4 {
    font-size: 1.2rem;
    font-weight: 700;
    color: #222;
}
.info small {
    font-weight: 800;
    color: var(--text-grey);
}
.contact span{
  font-size: 1.2rem;
  display: inline-block;
  margin-left: .5rem;
  color:  var(--main-color);

}

@media only screen and (max-width: 1200px){

  .sidebar{
    width: 70px ;
  }
  .sidebar .sidebar-brand,
  .sidebar li 
  {
    padding-left: 1rem;
    text-align: center;
  }
  #nav-toggle:checked + .sidebar li a
  {
    padding-left: 0rem;
  }
  .sidebar .sidebar-brand h1 span:last-child,
  .sidebar li a span:last-child{
    display: none;

  }
  
  .main-content {
  margin-left: 70px;

  }
  .main-content  header{
    width: calc(100% - 70px);
    left:70px;

  }
}

@media only screen and (max-width: 960px){
  .cards{
    grid-template-columns: repeat(3, 1fr);
  }
  .recent-grid{
    grid-template-columns: 60% 40%;
  }
}

@media only screen and (max-width: 768px){
  .cards{
    grid-template-columns: repeat(2, 1fr);
  }
  .recent-grid{
    grid-template-columns: 100%;
  }
  .search-wrapper{
    display: none;
  }
  .sidebar {
    
    left: -100% !important;
  }
  header h2{
    display: flex;
    align-items: center;
  }
  header h2 label{
    display: inline-block;
    text-align: center;
    background: var(--main-color);
    padding-right: 0rem;
    margin-right: 1rem;
    height: 40px;
    width: 40px;
    border-radius: 50%;
    color: #fff;
    display: flex;
    align-items: center;
    justify-content: center !important;
  }
  header h2 span{
    text-align: center;
    padding-right: 0rem;
  }
  header h2{
    font-size: 1.1rem;
  }
  .main-content{
    width: 100%;
    margin-left: 0rem;
  }
  header{
    width: 100% !important;
    left: 0 !important;
  }
  #nav-toggle:checked + .sidebar{
    left: 0 !important;
    z-index: 100;
    width: 345px;
  }
  
  #nav-toggle:checked .sidebar .sidebar-brand,
  #nav-toggle:checked + .sidebar li 
  {
    padding-left: 2rem;
    text-align: left;
  }

  #nav-toggle:checked + .sidebar li a
  {
    padding-left: 1rem;
  }
  #nav-toggle:checked  + .sidebar .sidebar-brand h1 span:last-child,
  #nav-toggle:checked + .sidebar li a span:last-child{
    display: inline;

  }
  #nav-toggle:checked ~ .main-content{
    margin-left: 0rem !important;
  }
}
@media only screen and (max-width: 560px){
  .cards{
    grid-template-columns: 100%;
  }
}


</style>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['line']});
      google.charts.setOnLoadCallback(drawChart);

    function drawChart() {

      var data = new google.visualization.DataTable();
      data.addColumn('number', '${topTitle}');
      data.addColumn('number', '${legend}');

      data.addRows([
 
				<c:forEach var="i" begin="0" end="6" varStatus="st">
				  [${visitDays[6-i]}, ${visitCounts[6-i]}],
				</c:forEach>
    	  ]);

      var options = {
        chart: {
          title: '${title}',
          subtitle: '${subTitle}',
          topTitle: '${topTitle}'
        },
        width: 650,
        height: 500,
        axes: {
          x: {
            0: {side: 'top'}
          }
        }
      };

      var chart = new google.charts.Line(document.getElementById('line_top_x'));

      chart.draw(data, google.charts.Line.convertOptions(options));
    }
</script>
<body>
<div class="container" style="margin-left: 25%;  margin-top: 3%; max-width : 1250px;">
 <main>
 <div style="display: -webkit-box;">
 			<div class="col-xl-3 col-sm-6 col-12">
        <div class="card">
          <div class="card-content">
            <div class="card-body">
              <div class="media d-flex">
                <div class="align-self-center">
                  <i class="icon-speech warning font-large-2 float-left"></i>
                </div>
                <div class="media-body text-right">
                  <h3>${noReply}</h3>
                  <span>미답변</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>				
      <div class="col-xl-3 col-sm-6 col-12">
        <div class="card">
          <div class="card-content">
            <div class="card-body">
              <div class="media d-flex">
                <div class="media-body text-left">
                  <h3 class="success">${memberCnt}</h3>
                  <span>총 회원</span>
                </div>
                <div class="align-self-center">
                  <i class="icon-user success font-large-2 float-right"></i>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      			<div class="col-xl-3 col-sm-6 col-12">
        <div class="card" style="    height: 167.5%;   width: 220%;">
          <div class="card-content">
            <div class="card-body">
              <div class="media d-flex">
                <div class="media-body text-left">
                  <h3 class="danger" style="font-size: -webkit-xxx-large;">${totalOrder}</h3>
                  <span>주문수</span>
                </div>
                <div class="align-self-center">
                  <i class="icon-rocket danger font-large-2 float-right"></i>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      </div>
				    <div class="col-xl-6 col-md-12">
				      <div class="card">
				        <div class="card-content">
				          <div class="card-body cleartfix">
				            <div class="media align-items-stretch">
				              <div class="align-self-center">
				                <h1 class="mr-2">
				                <fmt:formatNumber value="${totalSum}"/>원
				                </h1>
				              </div>
				              <div class="media-body">
				                <h4>수익</h4>
				                <span>(최근 7일)</span>
				              </div>
				              <div class="align-self-center">
				                <i class="icon-wallet success font-large-2"></i>
				              </div>
				            </div>
				          </div>
				        </div>
				      </div>
				    </div>  
        <div class="recent-grid">
          <div class="projects">
            <div class="card">
              <div class="card-header" style="background: cadetblue;">
                <font color="white"><h2>방문자 수</h2></font>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                	   <div id="line_top_x"></div>
                </div>
              </div>
            </div>

          </div>
          <div class="customers">
            <div class="card">
              <div class="card-header"style="background: coral;">
                 <h2><font color="white">신규 회원</font></h2>
              </div>
              <div class="card-body">
              	<c:forEach var="vo" items="${newMember}" begin="1" end="9">
                <div class="customer">
                  <div class="info">
                    <div>
                      <h4>${vo.mid}</h4>
                      <small>${vo.nickName}</small>
                    </div>
                  </div>
                </div>
                </c:forEach>
              </div>
            </div>

          </div>
          
        </div>  

      </main>
      </div>
</body>
