<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<tiles:insertAttribute name="asset"/>
<style>
.hidden-review{
	display: none;
}
.detail-userinfo-button{
		text-align:center;
		padding-right:10px;
		width: 80px;
		height: 35px;
		border: 1px solid #ffffff;
		border-radius: 0.6rem;
		background-color: #f0f0f0;
	}
	form {
		padding: 0px auto;
	}
	.detail-userinfo-list{
		position: relative;
	    flex-direction: column;
	    min-width: 0;
	    word-wrap: break-word;
	    background-clip: border-box;
	    margin: 50px 350px;
	    margin-top: 100;
	    text-align: left;
	    max-width: 1320px;
	    margin-left: auto;
	    margin-right: auto;
	}
	.detail-userinfo{
		display: block;
		padding-left: 50px;
		padding-bottom: 5px;
	}
	.detail-userinfo info{
		border: 1px solid #999999;
		border-radius: 0.35rem;
	}
	.detail-userinfo-table{ 
		margin: 20px auto;
	}
	.detail-userinfo-table th{
		padding-right: 50px;
		padding-bottom: 10px;
		padding-top: 10px;
		border: 1px solid #999999;
		border-radius: 0.35rem;
		padding: 10px 20px;
	}
	.detail-userinfo-table td {
		border: 1px solid #999999;
		border-radius: 0.35rem;
		padding: 10px 10px;
	}
	.detail-userinfo-table input{
		padding: 4px 10px;
		margin: 0 5px;
	}
	.detail-userinfo-detail{
		width: 550px;
		height: 100px;
		margin: 0 5px;
	}
	.oneclickservice > div {
		display: flex;
	}
	.help-tip{
		text-align: center;
		cursor: default;	
		margin: 5px 5px;
	}
	
	.help-tip:hover p{	
		display:block;	
		transform-origin: 100% 0%;
		-webkit-animation: fadeIn 0.3s ease-in-out;	
		animation: fadeIn 0.3s ease-in-out;	
	}
	.help-tip p{	
		display: none;	
		text-align: left;		
		background-color: #f1f1f1;	
		padding: 20px;	
		width: 300px;
		position: absolute;	
		border-radius: 3px;	
		box-shadow: 1px 1px 1px rgba(0, 0, 0, 0.2);	
		color: #000000;	
		font-size: 13px;	
		line-height: 1.4;
		bottom: -12px;
	}
	.help-tip p:before{	
		position: absolute;	
		content: '';	
		width:0;	
		height: 0;
		border:6px solid transparent;	
		border-bottom-color:#f1f1f1;
		top:-12px;	
	}
	.help-tip p:after{	
		width:100%;	
		height:40px;	
		content:'';
		position: absolute;	
		top:-40px;	
		left:0;	
	}
	.oneclickhide{
		display:none;
	}
	.rezuser-choice-hide{
		display:none;
	}
	.reservation-button{
		display:flex;
		align-items:center;
		justify-content:center;
		width: 480px;
		height: 50px;
		border: 1px solid #fff;
		border-radius: 0.6rem;
		background-color: #f0f0f0;
		margin-top: 50px;
		margin-left: auto;
		margin-right: auto;
	}
	.rez-body-top {
		display:flex;
		align-items:center;
		justify-content:center;
		width:1320px;
		max-width: 1320px;
		margin-left: auto;
		margin-right: auto;
	}


/* 위로 테스트 */
	#hospital-list{
		width: 100%;
	}
	.bookmark-icon-link{
		background: #fff;
		color: #000000;
		border: 1px solid #fff; 
	}
	.rezuser-choice-hide{
		display:none;
	}
	.oneclickhide{
		display:none;
	}
	.type-button{
		border: 1px solid #edf0f7;
		border-radius: 50px;
		background-color: #edf0f7;
		width: 50%;
		height: 20%;
		margin: 10px 0;
	}
	.reservation-modal {
	  width: 100%;
	  height: 100%;
	  padding: 20px 0;
	  transition: all 600ms cubic-bezier(0.86, 0, 0.07, 1);
	  background-color : rgba(255,255,255);
	  top: 100%;
	  position: fixed;
	  left: 0;
	  text-align: center;
	  z-index: 200;
	}
	.container.modal-open .reservation-modal {
	  top: 60%;
	  z-index: 999;
	}
	.js-close-modal {
		opacity: 0;
	}
	.hide-tag{
		display: none;
	}
	.dept-hide-tag{
		display: none;
	}
	#tagList{
		display: grid;
		grid-template-columns: repeat(8, 1fr);
	}
	#deptList{
		display: grid;
		grid-template-columns: repeat(8, 1fr);
	}
	.hospital-info-list{
		border: 1px solid #000000;
	}
	.tag{
		padding: var(--bs-nav-link-padding-y) var(--bs-nav-link-padding-x);
		background-color: #fff;
		color: #000;
		border: 1px solid #000000;
		border-radius: 3px;
		margin: 1px 3px;
	}
	.hospital-name-dept{
		display: flex;
	}
	.hospital-info-dept{
		background-color: #fff;
		color: #000;
		border: 1px solid #000000;
	}
	.dept-tag{
		padding: var(--bs-nav-link-padding-y) var(--bs-nav-link-padding-x);
		background-color: #fff;
		color: #000;
		border: 1px solid #000000;
		border-radius: 3px;
		margin: 1px 3px;
	}
	.hospital-info-grid {
		margin-top: 10px;
		display: flex;
	}
	.hospital-info-flex {
		display: flex;
	    align-items: flex-end;
	    justify-content: space-between;
	}
	.box-content{
		border: 1px solid #5bc1ac;
		border-radius: 3px;
		margin: 1px 3px;
		padding: 1px 3px;
		text-align: center;
	}
	.dept-box-content{
		border: 1px solid #fff;
	}
	.box-content-color{
		background-color: #5bc1ac;
		color: #fff;
	}
	.docter-images {
		width: 150px;
		height: 150px;
		border-radius: 3px;
		opacity: 0.6;
	}
	.docter-images:hover {
		opacity: 1;
	}
	.review-grid{
		display: flex;
		justify-content: space-between;
	}
	.reservation-button {
		color: #000000;
		background-color: #fff;
		text-align:center;
		font-size: 30px;
		border-radius: 40px;
		padding: 10px 25px;
		display: inline-block;
		transition: all .4s ease;
		cursor: pointer;
		border: 1px;
		position: fixed;
		bottom: 10px;
		height: 4rem;
		width: 700px;
		font-weight: bold;
		box-shadow: 1px 1px 5px #000000;
		margin: 0 auto;
		left: 0;
		right: 0;
		z-index: 888;
	}
	.select-opacity {
		opacity: 0.4;
	}
	.reservation-modal-button-list {
		text-align:center;
		left: 0;
		right: 0;
		position: fixed;
		bottom: 10px;
	}
	.reservation-modal-button {
		text-align:center;
		font-size: 30px;
		border-radius: 40px;
		padding: 10px 25px;
		display: inline-block;
		transition: all .4s ease;
		cursor: pointer;
		border: 1px;
		height: 4rem;
		width: 330px;
		margin: 0 20px;
		font-weight: bold;
		box-shadow: 2px 2px 5px #000000;
		background-color: #ffffff;
	}
	.review-progress-bar {
	    width: 50%;
	    height: 30px;
	    background-color: #dedede;
	    font-weight: 600;
	    font-size: .8rem;
	    border: 1px solid #ffffff;
	    border-radius: 50px;
	    display: inherit;
	}
	.review-progress-negative{
		padding-top: 5px;
		text-align: center;
	}
	.review-progress-bar .review-progress {
	    width: 50%;
	    height: 30px;
	    padding: 0;
		padding-top: 5px;
	    text-align: center;
	    background-color: #5bc1ac;
	    color: #111;
	    border: 1px solid #ffffff;
	    border-radius: 50px;
	}
	.clicked {
		background-color: #5bc1ac;
		color: #fff;
		border: #5bc1ac;
	}
	.more-button {
		border: 0;
		background-color: #fff;
		font-size: 18px;
	}
	.more-button-div {
		text-align: center;
	}
	.hospital-info-list {
		border: 1px solid #c5c5c5;
		border-radius: 10px;
		padding: 10px 20px;
		margin: 3px 5px;	
	}
	.hospital-info-info{
		margin: 0;
	}
	#doctor-choice{
		display: flex;
		justify-content: space-evenly;
		text-align: center;
		margin: 0 100px;
	}
	.listopentime{
		margin-bottom: 8px;
		font-size: .8rem;
	}
	.listopentimeinmark{
		display: flex;
	}
	.listopentimeoutmark{
	
	}
	.listopentimeinmark{
		background: #5bc1ac;
		border: 1px solid #5bc1ac;
		border-radius: 50%;
		width: 5px;
		height: 5px;
		margin-top: 7px;
		margin-right: 5px;
	}
	.listopentimeoutmark{
		background: #717275;
		border: 1px solid #717275;
		border-radius: 50%;
		width: 5px;
		height: 5px;
		margin-top: 7px;
		margin-right: 5px;
	}
</style>

</head>
<body id="section_1">

	<tiles:insertAttribute name="header"/>
	
	<tiles:insertAttribute name="content"/>
	
	<tiles:insertAttribute name="footer"/>
	
	
        
        

</body>
</html>