<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="/css/common/common.css"/>
    <script type="text/javascript" src=""></script>
    <script type="text/javascript" src="/js/common/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="/js/common/common.js"></script>
</head>

<body>

<div class="main">
    <div class="title">
        <h3>当前位置：<span>参与者 > 参与者操作列表</span></h3>
        <button class="btn inputNew">新增</button>
    </div>

    <!--table start-->
    <div class="table-container">
        <!--table list-->
        <div class="table">
            <table>
                <tr>
                    <th>编号</th>
                    <th>参与者编号</th>
                    <th>中文简称</th>
                    <th>中文全称</th>
                    <th>英文简称</th>
                    <th>英文全称</th>
                    <th>国家代码</th>
                    <th>是否法人机构</th>
                    <th>非法人对应机构</th>
                    <th>所属省、直辖市、自治区</th>
                    <th>注册地址</th>
                    <th>邮编</th>
                    <th>机构类别</th>
                    <th>分支机构序号</th>
                    <th>是否金融机构</th>
                    <th>成立日期</th>
                    <th>营业执照号</th>
                    <th>组织机构代码证号</th>
                    <th>金融许可证号</th>
                    <th>其他证件</th>
                    <th>其他证件号</th>
                    <th>公司通讯地址</th>
                    <th>备注</th>
                    <th>第一联系人编号</th>
                    <th>第一联系人名称</th>
                    <th>第二联系人编号</th>
                    <th>第二联系人名称</th>
                    <th>会员状态</th>
                    <th>开户日期</th>
                    <th>录入人编号</th>
                    <th>录入人名称</th>
                    <th>录入日期</th>
                    <th>更新人编号</th>
                    <th>更新人名称</th>
                    <th>更新人日期</th>
                    <th>操作状态</th>
                    <th>操作类型</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageMsg}" var="i">
                    <tr>
                        <td>${i.opSequenceNo}</td>
                        <td>${i.memberId}</td>
                        <td>${i.memShortName}</td>
                        <td>${i.memFullName}</td>
                        <td>${i.memEnShortName}</td>
                        <td>${i.memEnFullName}</td>
                        <td>${i.countryCode}</td>
                        <td>${i.corpOrgFlag}</td>
                        <td>${i.unCorpOrg}</td>
                        <td>${i.areaCode}</td>
                        <td>${i.regAddr}</td>
                        <td>${i.postcode}</td>
                        <td>${i.orgType}</td>
                        <td>${i.branchNo}</td>
                        <td>${i.financeOrgFlag}</td>
                        <td>${i.setupDate}</td>
                        <td>${i.bizLicCode}</td>
                        <td>${i.orgCode}</td>
                        <td>${i.financeLicCode}</td>
                        <td>${i.otherCert}</td>
                        <td>${i.otherCertNo}</td>
                        <td>${i.contactAddr}</td>
                        <td>${i.remark}</td>
                        <td>${i.contact1Id}</td>
                        <td>${i.contact1Name}</td>
                        <td>${i.contact2Id}</td>
                        <td>${i.contact2Name}</td>
                        <td>${i.memStatus}</td>
                        <td>${i.accountOpenDate}</td>
                        <td>${i.inputOperId}</td>
                        <td>${i.inputOperName}</td>
                        <td>${i.inputDate}</td>
                        <td>${i.auditOperId}</td>
                        <td>${i.auditOperName}</td>
                        <td>${i.auditDate}</td>
                        <td>${i.operExecuteStatus}</td>
                        <td>${i.operType}</td>
                        <td>
                            <button class="btn modify">修改</button>
                            <button class="btn delete">删除</button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <!--table end-->
</div>

<!--操作条目修改弹出框start-->
<div class="input" id="modify">
    <form action="" method="post">
        <h1>操作条目修改<span class="close">×</span></h1>
        <ul>
            <li><span>编号：</span><input name="opSequenceNo" type="text"/></li>
            <li><span>参与者编号：</span><input name="memberId" type="text"/></li>
            <li><span>中文简称：</span><input name="memShortName" type="text"/></li>
            <li><span>中文全称：</span><input name="memFullName" type="text"/></li>
            <li><span>英文简称：</span><input name="memEnShortName" type="text"/></li>
            <li><span>英文全称：</span><input name="memEnFullName" type="text"/></li>
            <li><span>国家代码：</span><input name="countryCode" type="text"/></li>
            <li><span>是否法人机构：</span><input name="corpOrgFlag" type="text"/></li>
            <li><span>非法人对应机构：</span><input name="unCorpOrg" type="text"/></li>
            <li><span>所属省、直辖市、自治区：</span><input name="areaCode" type="text"/></li>
            <li><span>注册地址：</span><input name="regAddr" type="text"/></li>
            <li><span>邮编：</span><input name="postcode" type="text"/></li>
            <li><span>机构类别：</span><input name="orgType" type="text"/></li>
            <li><span>分支机构序号：</span><input name="branchNo" type="text"/></li>
            <li><span>是否金融机构：</span><input name="financeOrgFlag" type="text"/></li>
            <li><span>成立日期：</span><input name="setupDate" type="text"/></li>
            <li><span>营业执照号：</span><input name="bizLicCode" type="text"/></li>
            <li><span>组织机构代码证号：</span><input name="orgCode" type="text"/></li>
            <li><span>金融许可证号：</span><input name="financeLicCode" type="text"/></li>
            <li><span>其他证件：</span><input name="otherCert" type="text"/></li>
            <li><span>其他证件号：</span><input name="otherCertNo" type="text"/></li>
            <li><span>公司通讯地址：</span><input name="contactAddr" type="text"/></li>
            <li><span>备注：</span><input name="remark" type="text"/></li>
            <li><span>第一联系人编号：</span><input name="contact1Id" type="text"/></li>
            <li><span>第一联系人名称：</span><input name="contact1Name" type="text"/></li>
            <li><span>第二联系人编号：</span><input name="contact2Id" type="text"/></li>
            <li><span>第二联系人名称：</span><input name="contact2Name" type="text"/></li>
            <li><span>会员状态：</span><input name="memStatus" type="text"/></li>
            <li><span>开户日期：</span><input name="accountOpenDate" type="text"/></li>
            <li><span>录入人编号：</span><input name="inputOperId" type="text"/></li>
            <li><span>录入人名称：</span><input name="inputOperName" type="text"/></li>
            <li><span>录入日期：</span><input name="inputDate" type="text"/></li>
            <li><span>更新人编号：</span><input name="auditOperId" type="text"/></li>
            <li><span>更新人名称：</span><input name="auditOperName" type="text"/></li>
            <li><span>更新人日期：</span><input name="auditDate" type="text"/></li>
            <li><span>操作状态：</span><input name="operExecuteStatus" type="text"/></li>
            <li><span>操作类型：</span><input name="operType" type="text"/></li>
        </ul>
        <div class="btns">
            <button class="btn submit" type="submit">确定</button>
            <button class="btn close" type="button">取消</button>
        </div>
    </form>
</div>
<!--操作条目修改弹出框end-->

<!--操作条目删除弹出框start-->
<div class="input" id="delete">
    <form action="" method="post">
        <h1>操作条目删除<span class="close">×</span></h1>
        <button class="btn submit" type="submit">确定</button>
        <button class="btn close" type="button">取消</button>
    </form>
</div>
<!--操作条目删除弹出框end-->

<script>
    $(function () {
        //条目修改
        $(".modify").click(function () {
            $("#modify").fadeIn(50);
        })
        //条目删除
        $(".delete").click(function () {
            $("#delete").fadeIn(50);
        })
    })
</script>

</body>

</html>