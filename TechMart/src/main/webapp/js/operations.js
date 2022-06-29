/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

//this file is for the crud operations of different users

function manageAgents(){

         
    const updatebtn = document.querySelectorAll('#updatebtn');
    if(updatebtn===null) return ;
    updatebtn.forEach(btn=>{

       btn.addEventListener('click',(e)=>{
           const tableValues = (e.target.parentElement.parentElement);
          const data=(tableValues.children);

          document.querySelector('#exuserid').value=(data[0].textContent);
          document.querySelector('#newname').value=data[1].textContent;
          document.querySelector('#newemail').value=(data[3].textContent);
          document.querySelector('#newpassword').value=(data[4].textContent);

       })

    })
    
    const deleteBtn = document.querySelectorAll('#deletebtn');
    if(deleteBtn===null) return;
    deleteBtn.forEach(btn=>{
         btn.addEventListener('click',(e)=>{
             
             const tableValues = (e.target.parentElement.parentElement);
             const data=(tableValues.children);
             document.querySelector('#deleteid').value = data[0].textContent;
             console.log(data[0].textContent);
         })
        
    })
}
manageAgents();

//managing products
function addPath(){
    var fullPath = document.getElementById('file').value;
    let path = document.querySelector('#path');
    if (fullPath) {
    var startIndex = (fullPath.indexOf('\\') >= 0 ? fullPath.lastIndexOf('\\') : fullPath.lastIndexOf('/'));
    var filename = fullPath.substring(startIndex);
    if (filename.indexOf('\\') === 0 || filename.indexOf('/') === 0) {
        filename = filename.substring(1);
        path.value=`products/${filename}`;
        console.log(`products/${path.value}`);
    }
    console.log(filename);
}
    
    
}


//prduct updations and deleting
function updateAndDel(){
    const updateBtn = document.querySelectorAll('#update__btn');
    if(updateBtn===null) return;
    updateBtn.forEach(btn=>{
        btn.addEventListener('click',(e)=>{
            const cardBody=(e.target.parentElement.previousElementSibling.children);
            let price= cardBody[4].textContent.split(' ');
            price=Number(price[1]);
            console.log(price);
            document.querySelector('#newName').value=(cardBody[2].textContent);
             document.querySelector('#newdesc').value=cardBody[3].textContent;
             document.querySelector('#newPrice').value=price;
//            console.log(Number(cardBody[4].textContent));
             document.querySelector('#updates_Id').value=cardBody[6].value;
           
        })
    })
    
    const deleteButton = document.querySelectorAll('#delete__btn');
    if(deleteButton===null)return;
    deleteButton.forEach(btn=>{
        btn.addEventListener('click',(e)=>{
            let ids=e.target.parentElement.previousElementSibling;
            ids=ids.children[6];
            console.log(ids.value);
            document.querySelector('#product__deleteid').value=ids.value;
     
            
        })
    })
}

updateAndDel();


function stockManagement(){
    
    const requestBtn = document.querySelectorAll('#requestBtn');
    if(requestBtn===null) return;
    requestBtn.forEach(btn=>{
        btn.addEventListener('click',(e)=>{
          const tableValues = (e.target.parentElement.parentElement);
          const data=(tableValues.children);
          console.log(data);
          const productId= document.querySelector('#requestProductId');
          productId.value=data[0].textContent;
            
        })
    })
}
stockManagement();


function restock(){
    const restockBtn = document.querySelectorAll('#restockBtn');
    restockBtn.forEach((btn)=>{
         btn.addEventListener('click',(e)=>{
           const tableValues = (e.target.parentElement.parentElement);
          const data=(tableValues.children);
          document.querySelector('#restockId').value=Number(data[0].textContent);
          document.querySelector('#restockProduct').value =(data[1].textContent);
          document.querySelector('#stock_amount').value=Number(data[3].textContent);
          let test=((data[3].textContent));

         });
        
    });
    
    
}
restock();


function finalizeOrder(){
    const finalizeBtn = document.querySelectorAll('#finalizeBtn');
    finalizeBtn.forEach(btn=>{
        btn.addEventListener('click',(e)=>{
          const tableValues = (e.target.parentElement.parentElement);
          const data=(tableValues.children);
          document.querySelector('.viewAddress').textContent=`Location :${data[7].textContent}`;
          document.querySelector('#orderId__fin').value=data[0].textContent;
    })
      
  })

}

finalizeOrder();