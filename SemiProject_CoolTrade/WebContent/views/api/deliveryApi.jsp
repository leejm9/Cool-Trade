<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>API 호출 테스트</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <h1>API 호출 결과</h1>
    <div id="apiResponse"></div>

    <script>
        // AJAX를 사용하여 서블릿 호출
        $(document).ready(function() {
            $.ajax({
                url: "APICallerServlet",
                type: "GET",
                success: function(response) {
                    $("#apiResponse").html(response);
                },
                error: function(xhr, status, error) {
                    console.error("An error occurred while calling the servlet:", error);
                }
            });
        });
    </script>
</body>
</html>