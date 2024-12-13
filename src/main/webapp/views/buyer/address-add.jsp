<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="container">
    <h2 class="mb-4">Add Shipping Address</h2>

    <form action="${pageContext.request.contextPath}/buyer/address/create-address" method="POST">
        <input type="hidden" name="currentBuyerID" value="${buyerID}"/>

        <div class="row">
            <div class="single-form col-md-6 mb-3">
                <label for="fullName">Full Name</label>
                <input type="text" id="fullName" name="fullName" class="form-control" required />
            </div>

            <div class="single-form col-md-6 mb-3">
                <label for="streetNumber">Street Number</label>
                <input type="number" id="streetNumber" name="streetNumber" class="form-control"  required />
            </div>

            <div class="form-group col-md-12 mb-3">
                <label for="streetName">Street Name</label>
                <input type="text" id="streetName" name="streetName" class="form-control"  required />
            </div>

            <div class="form-group col-md-4 mb-3">
                <label for="commune">Commune</label>
                <input type="text" id="commune" name="commune" class="form-control"  required />
            </div>

            <div class="form-group col-md-4 mb-3">
                <label for="district">District</label>
                <input type="text" id="district" name="district" class="form-control"  required />
            </div>

            <div class="form-group col-md-4 mb-3">
                <label for="province">Province</label>
                <input type="text" id="province" name="province" class="form-control" required />
            </div>
        </div>

        <!-- Nút Update và Cancel -->
        <div class="row mt-3">
            <div class="col-md-2">
                <button type="submit" class="btn btn-success btn-sm w-100" style="background-color:rgb(243, 79, 63); border:0px; margin-bottom: 25px;">Save</button>
            </div>
            <div class="col-md-2">
                <a href="${pageContext.request.contextPath}/buyer/account" class="btn btn-secondary btn-sm w-100">Cancel</a>
            </div>
        </div>
    </form>
</div>
