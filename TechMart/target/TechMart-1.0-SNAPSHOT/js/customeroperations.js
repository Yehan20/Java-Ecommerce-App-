/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


//this js file is responsible for the customers operations that happens


function manageShowcase(){
    
const orderBtn = document.querySelectorAll('#orderBtn');
const amount=document.querySelector('#showcase__amount');

if(orderBtn ===null || amount===null) return;

const itemCard = document.querySelectorAll('#itemCard');
itemCard.forEach((card)=>{
    let number=Number(card.children[0].children[7].textContent);
    var btn=(card.children[1].children[0]);
    if(number=== 0){ 
       
       btn.disabled=true;
       btn.textContent="Out of Stock";
    }
    else {
      btn.disabled=false;
       btn.textContent="Order";
    }
    
    
})

orderBtn.forEach(btn=>{
    //const letData=(e.target.parentElement.previousElementSibling.children);
    btn.addEventListener('click',(e)=>{
        const productData=(e.target.parentElement.previousElementSibling.children);
        console.log(productData[0].src);
        document.querySelector('#showcase__img').src=productData[0].src;
        document.querySelector('#showcase__text').textContent=productData[1].textContent;
        document.querySelector('#showcase__type').textContent=productData[2].textContent;
        document.querySelector('#showcase__price').textContent=productData[4].textContent;
        amount.textContent=`Amount: ${productData[7].textContent}`;
        document.querySelector('#showcase__desc').textContent=productData[3].textContent;
        document.querySelector('#showcase__branch').textContent=productData[5].textContent;
        document.querySelector('#showcase__productId').value= productData[6].value;
        document.querySelector('#showcase__productId_2').value= productData[6].value;
        
        
    })
})

    
}
manageShowcase();

function generatePrice(){
    const amount=document.querySelector('#showcase__amount');
    const changeQuantity= document.querySelector('#orderedAmount');
    if(changeQuantity===null) return ;
    let newprice=document.querySelector('#new_showcase__amount');
    
    changeQuantity.addEventListener('change',(e)=>{
         let amt= Number(amount.textContent.split(" ")[1]);
         let value=Number((e.target.value))
         if(amt-value===0 ) {
            changeQuantity.setAttribute('max',amt);
         }
         if(amt===0){
             console.log('empty');
         }


         let totprice= document.querySelector('#showcase__price').textContent.split(' ');
         let total=Number(totprice[1])*value;
         document.querySelector('#finalprice').value=total;
          newprice.innerText=`RS ${(total)}`;
    //    console.log(isNaN(total));


    })

}

generatePrice();


// payment menthod
function payments(){
    const pay=document.querySelector('#paymentMethod');
    if(pay===null) return;
    pay.addEventListener('change',(e)=>{
        let method=(e.target.value);
        if(method==="Card"){
            document.querySelector('.payment__box').innerHTML=`

               <div class="d-sm-flex gap">
                  <div class="mb-3 w-100">
                  <label for="productId" class="col-form-label">Card Number:</label>
                  <input type="text" name="town" required class="form-control" id="town">
               </div>
            
               <div class="mb-3 w-100">
                  <label for="productId" class="col-form-label">Card Holder Name:</label>
                  <input type="text"  required class="form-control" id="town">
               </div>
               </div>
          
            
                 <div class="mb-3 w-50">
                  <label for="productId" class="col-form-label">Security Key:</label>
                  <input type="number"  required class="form-control" id="key">
               </div>
              `
        }
        else{
            document.querySelector('.payment__box').innerHTML='';
        }
        
    })
    
}

payments();

function pay(){
    
    const payBtn = document.querySelectorAll('#payBtn');
    if(payBtn===null)return;
    payBtn.forEach(btn=>{
    btn.addEventListener('click',(e)=>{
        
        const towns=document.querySelector('#towns');
         const tableValues = (e.target.parentElement.parentElement);
         const data=(tableValues.children);
         document.querySelector('#your__price').textContent=" RS: " + data[5].textContent;
         document.querySelector('#payOrderId').value=data[0].textContent;
         
         let branch = data[4].textContent;
         console.log(branch);
           if(branch==="Gampaha")generateLocations(gampaha,towns);
           if(branch==="Colombo")generateLocations(colombo,towns);
           if(branch==="Kandy")generateLocations(kandy,towns);
    })
 })
 
}
pay();


const gampaha=["Gampaha","Negambo","Wattala","Kelaniya","Jaela","Kiribathgoda"];
const colombo=["Colombo","Moratuwa","Nugegoda","Kaduwela"];
const kandy=["Kandy","Peradeniya","Digana"];

function generateLocations(array,list){
    
          for(let i=0; i<array.length; i++){
             let option = document.createElement("option");
             option.textContent=array[i];
             option.value=array[i];
             list.appendChild(option);
         }
}


function cancelOrder(){
     const cancelBtn=document.querySelectorAll('#cancelBtn');
     cancelBtn.forEach(btn=>{
         btn.addEventListener('click',(e)=>{
              const tableValues = (e.target.parentElement.parentElement);
              const data=(tableValues.children);
              console.log(data);
              
              
	   document.querySelector("#deleteid__order").value=data[0].textContent;
           document.querySelector("#delete__productId").value=data[1].textContent;   
           document.querySelector("#delete__orderamount").value=data[3].textContent; 
         })
     })
}

cancelOrder();

