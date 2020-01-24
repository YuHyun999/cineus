<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("UTF-8");%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>결제창</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <link rel="stylesheet" href="../css/payment.css">
</head>
<body>
  <main class="page payment-page">
    <section class="payment-form dark">
      <div class="container">
        <form>
          <div class="products">
            <h3 class="title">결제하기</h3>
            <div class="item">
              <span class="price">$200</span>
              <p class="item-name">Product 1</p>
              <p class="item-description">수량</p>
            </div>
            <div class="item">
              <span class="price">$120</span>
              <p class="item-name">Product 2</p>
              <p class="item-description">수량</p>
            </div>
            <div class="item">
              <span class="price">$120</span>
              <p class="item-name">Product 3</p>
              <p class="item-description">수량</p>
            </div>
            <div class="item">
              <span class="price">$120</span>
              <p class="item-name">Product 4</p>
              <p class="item-description">수량</p>
            </div>
            <div class="item">
              <span class="price">$120</span>
              <p class="item-name">Product 5</p>
              <p class="item-description">수량</p>
            </div>
            <div class="total">Total<span class="price">$320</span></div>
          </div>
          <div class="card-details">
            <h3 class="title">Credit Card Details</h3>
            <div class="row">
              <div class="form-group col-sm-7">
                <label for="card-holder">생년월일/사업자번호</label>
                <input id="card-holder" type="text" class="form-control" placeholder="생년월일 6자리(예:801224)" aria-label="Card Holder" aria-describedby="basic-addon1">
              </div>
              <div class="form-group col-sm-5">
                <label for="">유효기간</label>
                <div class="input-group expiration-date">
                  <input type="text" class="form-control" placeholder="MM" aria-label="MM" aria-describedby="basic-addon1">
                  <span class="date-separator">/</span>
                  <input type="text" class="form-control" placeholder="YY" aria-label="YY" aria-describedby="basic-addon1">
                </div>
              </div>
              <div class="form-group col-sm-8">
                <label for="card-number">카드번호</label>
                <input id="card-number" type="text" class="form-control" placeholder="(-)기호 없이 16자리" aria-label="Card Holder" aria-describedby="basic-addon1">
              </div>
              <div class="form-group col-sm-4">
                <label for="cvc">비밀번호</label>
                <input id="cvc" type="text" class="form-control" placeholder="앞2자리" aria-label="Card Holder" aria-describedby="basic-addon1">
              </div>
              <div class="form-group col-sm-4">
                <label for="cvc">할부</label>
                <input id="cvc" type="text" class="form-control" placeholder="앞2자리" aria-label="Card Holder" aria-describedby="basic-addon1">
              </div>
              <div class="form-group col-sm-12">
                <button type="button" class="btn btn-primary btn-block">결제</button>
              </div>
            </div>
          </div>
        </form>
      </div>
    </section>
  </main>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>