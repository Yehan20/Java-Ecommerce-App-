/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const blueBar = document.querySelector('#bar')
window.addEventListener('scroll',(e)=>{
    console.log(scrollY);
    if(scrollY>100){
        blueBar.style.display='none'


    }
    if(scrollY<100){
      blueBar.style.display='block' 
    }
})
