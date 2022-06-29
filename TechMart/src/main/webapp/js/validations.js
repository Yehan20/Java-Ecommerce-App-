/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

// this js file has the all the client side form validations such as login and creating users

// user login

function loginUserValidations(){
    
    const form = document.querySelector('#loginForm');
    const errorMsg = document.querySelectorAll('.err');
    
    if(form===null || errorMsg===null) return;
    
    console.log(form);
    form.addEventListener('submit',(e)=>{       
       
        const username = form[0].value;
        const password = form[1].value;
        
        if(username===''){
        e.preventDefault();
        errorMsg[0].textContent='Required';
         setTimeout(()=>{
            errorMsg[0].textContent='';
         },1000)
        }
        
        if(password===''){
        e.preventDefault();    
        errorMsg[1].textContent='Required';
        setTimeout(()=>{
            errorMsg[1].textContent='';
         },1000)
         
        }
             
        
    })
    
    
}

function userSignupValidaton(){
    
    const form = document.querySelector('#signUpform');

   if(form===null) return;
   
    form.addEventListener('submit',(e)=>{
         
         let regex=/([a-zA-z]+\s)*[a-zA-z]$/;
         const error = document.querySelectorAll('.err');
         const [userName,fullName,nic,password,confirm] = [form[0].value,form[1].value,form[2].value,form[4].value,form[5].value];
         const [...feilds] =  [userName,fullName,nic,password,confirm];
         
         feilds.forEach((feild,index)=>{
             if(feild===''){
                 e.preventDefault();
                 error[index].textContent='*Required';
                 clear(error);
                
             }
         });
         
         if(userName.length<4 && userName!==''){
             e.preventDefault();
             error[0].textContent='Must be more than 4';
             clear(error);
         }
         
         if(fullName!=='' && !regex.test(fullName)){
             e.preventDefault();
             error[1].textContent='Name cannot have numbers of Symbols';
             clear(error);
         }
         
         if(password!=='' && confirm!=='' && password!==confirm){
             e.preventDefault();
             error[3].textContent = 'Not Matching';
             error[4].textContent = 'Not Matching';
             clear(error);
         }
        
         
        
         
         
        
    })
}
function clear(error){
    
   setTimeout(()=>{
       
     error.forEach(err=>{
      err.textContent='';
    })
    
  },1000);  

}
loginUserValidations();
userSignupValidaton();

//


