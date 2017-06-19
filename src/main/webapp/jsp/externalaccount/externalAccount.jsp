<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>内部账户</title>
    <link rel="stylesheet" href="/css/common/common.css"/>
    <link rel="stylesheet" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
    <link rel="stylesheet" href="/css/common/time.css"/>
    <script type="text/javascript" src="/js/common/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="/js/common/common.js"></script>
    <script type="text/javascript" src="/js/common/time.js"></script>

</head>
<body>
<!--header start-->
<div class="header">
    <div class="logo"></div>
    <ul class="nav">
        <!-- <li>菜单栏目-1</li>
        <li>菜单栏目-2</li>
        <li>菜单栏目-3</li> -->
    </ul>
    <ul class="message">
        <li>
            <!-- <img src="../img/admin.png" /> -->
            <span>用户名</span>
        </li>
        <li>
            <!-- <img src="../img/logout.png" /> -->
            <span>退出</span>
        </li>
    </ul>
</div>
<div class="menu">
    <div class="layout">

    </div>
</div>
<!--header end-->
<div class="main">
    <div class="title">
        <h3>
            当前位置：<span>内部账户 > 内部账户</span>	<span>总共${response.pageInfo.totalItems }条</span>
        </h3>
        <button class="btn addNew inputNew">新增</button>
        <button class="btn update inputUpdate">变更</button>
        <button class="btn delete inputDrop">注销</button>
        <button class="btn see">查看</button>
        <button class="btn search query">搜索</button>
    </div>
    <form id="listByPageForm" name="listByPageForm" action="/fund/inneraccount/inneraccount" method="post">
        <!--table start-->
        <div class="table-container">
            <!--table list-->
            <div class="table">
                <table>
                    <tr>
                        <th>操作</th>
                        <th>内部账户帐号</th>
                        <th>内部账号名称</th>
                        <th>币种</th>
                        <th>内部账户权限类型</th>
                        <th>内部账户所有者(持有人账号)</th>
                        <th>账户类型</th>
                        <th>机内账户类型</th>
                        <th>会计科目代码</th>
                        <th>会计科目名称</th>
                        <th>会计科目余额方向</th>
                        <th>结转类型</th>
                        <th>透支标志</th>
                        <th>核销类型</th>
                        <th>备注</th>
                        <th>录入人代码</th>
                        <th>录入人姓名</th>
                        <th>录入时间</th>
                        <th>核准人代码</th>
                        <th>核准人姓名</th>
                        <th>核准时间</th>
                        <th>生效状态</th>
                        <th>生效时间</th>
                        <th>开户时间</th>
                        <th>销户时间</th>
                        <th>最近更新序号</th>
                        <th>最近更新时间</th>
                    </tr>
                    <c:forEach items="${response.innerAccountVoList }" var="innerAccount">
                        <tr>
                            <td><input type="radio" name="radio" /></td>
                            <td>${innerAccount.innerAccount }</td>
                            <td>${innerAccount.innerAccountName }</td>
                            <td>${innerAccount.currency }</td>
                            <td data-type="D10003">${innerAccount.innerAccountAuthorityType }</td>
                            <td>${innerAccount.innerAccountOwnership }</td>
                            <td data-type="D10009">${innerAccount.accountType }</td>
                            <td data-type="D10012">${innerAccount.specialAccountType }</td>
                            <td>${innerAccount.subjectCode }</td>
                            <td>${innerAccount.subjectName }</td>
                            <td data-type="D10004">${innerAccount.subjectBalanceDirection }</td>
                            <td data-type="D10005">${innerAccount.balanceTransferType }</td>
                            <td data-type="D10006">${innerAccount.overdraftFlag }</td>
                            <td data-type="D10008">${innerAccount.verifyType }</td>
                            <td>${innerAccount.remark }</td>
                            <td>${innerAccount.inputOperatorCode }</td>
                            <td>${innerAccount.inputOperatorName }</td>
                            <td><fmt:formatDate value="${innerAccount.inputDatetime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                            <td>${innerAccount.auditOperatorCode }</td>
                            <td>${innerAccount.auditOperatorName }</td>
                            <td><fmt:formatDate value="${innerAccount.auditDatetime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                            <td data-type="D10013">${innerAccount.effectStatus }</td>
                            <td><fmt:formatDate value="${innerAccount.effectDatetime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                            <td><fmt:formatDate value="${innerAccount.accountOpenDatetime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                            <td><fmt:formatDate value="${innerAccount.accountCancelDatetime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                            <td>${innerAccount.updateSequenceNo }</td>
                            <td><fmt:formatDate value="${innerAccount.updateDatetime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        </tr>
                    </c:forEach>
                </table>
                <div class="pagination">
                    <button id="prev" class="btn prev">上一页</button>
                    <button id="next" class="btn next">下一页</button>
                    <span class="pageNumber">
						第<span id="currentPage">${response.pageInfo.currentPage}</span>页
						／
						共<span id="totalPage">${response.pageInfo.totalPage }</span>页
					</span>
                    <span>到</span>
                    <input type="text" id="toCurrentPage" name="currentPage" value="${response.pageInfo.currentPage}" />
                    <span>页</span>
                    <button type="submit" class="btn" id="paegSubmit">确定</button>
                </div>
            </div>
        </div>
        <!--table end-->
    </form>
</div>


</body>
</html>
