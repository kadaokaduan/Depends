<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>雳鉴插桩式IAST测试用例集合</title>
  <link rel="stylesheet" href="js/bootstrap.min.css" media="screen">
  <script src="js/angular.min.js" charset="utf-8"></script>
  <style media="screen">
	thead tr td {
		background-color: #f1f1f1
	}
  </style>
</head>

<body>
  <div ng-app="myapp" ng-controller="main">
	<div class="container" id="main">
		<div class="row">
			<div class="col-xs-12 col-sm-8 col-sm-offset-2">
				<h3 class="text-center">雳鉴插桩式IAST测试用例集合</h3>
                <br/>
				<table class="table table-striped">
					<thead>
						<tr>
							<td>测试用例</td>
							<td>用例路径</td>
						</tr>
					</thead>
					<tbody>
						<a target="_blank" href="vulns/clickall"><button type="button" class="btn btn-primary" style="float:right;margin-bottom: 10px;">一键触发所有链接</button></a>
						<tr ng-repeat="a in testcases">
							<td>{{a.name}}</td>
							<td><a target="_blank" ng-href="{{a.path}}">{{a.path}}</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
  </div>
  
  <script type="text/javascript">
    var app = angular.module('myapp', []);

    app.controller('main', ['$scope', '$http',
      function($scope, $http) {

        $scope.testcases = [
        	{"name": "001 - 目录穿越", "path": 'vulns/dir'},
        	{"name": "002 - XSS", "path": 'vulns/xss'},
        	{"name": "003 - SQL注入", "path": 'vulns/sql'},
        	{"name": "004 - log注入", "path": 'vulns/log'},
			{"name": "005 - Xpath注入", "path": 'vulns/xpath'},
			{"name": "006 - 表达式注入","path": 'vulns/el'},
			{"name": "007 - SSRF", "path": 'vulns/ssrf'},
			{"name": "008 - URL Redirect", "path": 'vulns/url-redirect'},
			{"name": "009 - Ldap注入", "path": 'vulns/ldap'},
			{"name": "010 - HQL注入", "path": 'vulns/hql'},
			{"name": "011 - XXE", "path": 'vulns/xxe'},
			{"name": "012 - json数据源", "path": 'vulns/json'},
			{"name": "013 - 命令执行", "path": 'vulns/commond-execution'},
			{"name": "014 - 密码/加密密钥硬编码","path": 'vulns/hardcodedpasswd'},
			{"name": "015 - 任意文件上传漏洞", "path": 'vulns/file-upload'},
			{"name": "016 - 不安全的反序列化", "path": 'vulns/deserialization'},
			{"name": "017 - 不安全的随机数", "path": 'vulns/insecure-random'},
			{"name": "018 - 不安全的加密算法", "path": 'vulns/weak-encryption'},
			{"name": "019 - 不安全的哈希", "path": 'vulns/insecure-hash'},
			{"name": "020 - 不安全的cookie", "path": 'vulns/insecure-cookie'},
			{"name": "021 - 违反信任边界", "path": 'vulns/trust-boundry'},
			{"name": "022 - HTTP头部注入", "path": 'vulns/header-Injection'},
			{"name": "023 - providers靶场", "path": 'vulns/providers'},
			{"name": "024 - 多重循环性能测试", "path": 'vulns/max'},
			{"name": "025 - 过滤规则测试", "path": 'vulns/sanitize'},
			{"name": "026 - 自定义规则测试", "path": 'vulns/custom-rule'},
			{"name": "027 - gdpr个人隐私数据泄漏", "path": 'vulns/gdpr'},
			{"name": "028 - 加密场景测试","path": 'vulns/EncryptRequest'},
			{"name": "029 - dubbo场景测试","path": 'vulns/dubbo'},
			{"name": "030 - 许可证风险测试","path": 'vulns/license'},
			{"name": "031 - 外部接口发送验证码","path": 'vulns/sendsms'},
			{"name": "032 - 外部接口发送邮件","path": 'vulns/sendmail'},
			{"name": "033 - 外部接口腾讯COS","path": 'vulns/Tlcos'},
			{"name": "034 - 腾讯云人脸识别","path": 'vulns/TlFace'},
			{"name": "035 - 华为云图像搜索","path": 'vulns/huaweiImageSearch'},
			{"name": "036 - 访问站点","path": 'vulns/visitsite'},
        ]

      }
    ]);
  </script>

</body>
</html>
