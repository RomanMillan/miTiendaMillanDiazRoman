const orderList = document.querySelector(".orderList");

orderList.addEventListener("change",()=>{
	window.open(orderList.value,"_self")
})