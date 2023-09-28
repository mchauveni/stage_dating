const Calendar={days:{Mon:"Lundi",Tue:"Mardi",Wed:"Mercredi",Thu:"Jeudi",Fri:"Vendredi",Sat:"Samedi",Sun:"Dimanche"},months:{Jan:"Janvier",Feb:"Février",Mar:"Mars",Apr:"Avril",May:"Mai",Jun:"Juin",Jul:"Juillet",Aug:"Âout",Sep:"Septembre",Oct:"Octobre",Nov:"Novembre",Dec:"Décembre"},offset:0,start:null,end:null,render:()=>{Calendar.container=$(".js-calendar"),Calendar.container&&(Calendar.inputdefaultstart=$("#dateInscStart").value,Calendar.inputdefaultend=$("#dateInscEnd").value,Calendar.offset=(new Date).getUTCMonth()-new Date($("#dateInscStart").value).getUTCMonth(),Calendar.start=Calendar.defaultstart=(new Date($("#dateInscStart").value).getTime()/1e3/60/60/24).toFixed(0),Calendar.end=Calendar.defaultend=(new Date($("#dateInscEnd").value).getTime()/1e3/60/60/24).toFixed(0),Calendar.container.innerHTML=`${Calendar.components.header()}\n                    <div class="calendar_body">\n                        ${Calendar.components.body()}\n                    </div>`,Calendar.DOM={containerForm:Calendar.container.closest("form"),calendarDate:$(".calendar_date"),calendarNavL:$(".calendar_nav.l"),calendarNavR:$(".calendar_nav.r"),calendarBody:$(".calendar_body"),inputDateStart:$("#dateInscStart"),inputDateEnd:$("#dateInscEnd")},Calendar.handleEvents())},swipe:e=>{Calendar.offset+=e,Calendar.DOM.calendarBody.innerHTML=Calendar.components.body()},handleEvents:()=>{Calendar.DOM.calendarNavL.addEventListener("click",(()=>Calendar.swipe(1))),Calendar.DOM.calendarNavR.addEventListener("click",(()=>Calendar.swipe(-1))),Calendar.DOM.calendarBody.addEventListener("click",Calendar.handleSelection),Calendar.DOM.containerForm.addEventListener("reset",(()=>{Calendar.offset=(new Date).getUTCMonth()-new Date($("#dateInscStart").value).getUTCMonth(),Calendar.start=Calendar.defaultstart,Calendar.end=Calendar.defaultend,Calendar.DOM.inputDateStart.value=Calendar.inputdefaultstart,Calendar.DOM.inputDateEnd.value=Calendar.inputdefaultend,Calendar.DOM.calendarBody.innerHTML=Calendar.components.body()}))},handleSelection:e=>{if(e.target.classList.contains("calendar_cell")){let a=e.target;Calendar.start?a.dataset.date===Calendar.start?(Calendar.start=null,Calendar.end=null,Calendar.DOM.inputDateStart.value=null,Calendar.DOM.inputDateEnd.value=null):a.dataset.date!==Calendar.start&&a.dataset.date>Calendar.start&&(Calendar.end=a.dataset.date,Calendar.DOM.inputDateEnd.value=a.dataset.inputdate):(Calendar.start=a.dataset.date,Calendar.DOM.inputDateStart.value=a.dataset.inputdate),Calendar.DOM.calendarBody.innerHTML=Calendar.components.body()}},components:{header:()=>{let e=new Date;return e.setMonth(e.getMonth()-Calendar.offset),`<div class="calendar_head">\n                <i class="calendar_nav l">\n                    <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M6 9l6 6 6-6" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/></svg>\n                </i>\n                <div class="calendar_date">${Object.values(Calendar.months)[e.getMonth()]} ${e.getFullYear()}</div>\n                <i class="calendar_nav r">\n                    <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M6 9l6 6 6-6" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/></svg>\n                </i>\n            </div>`},body:()=>{let e=new Date,a=e.getTime();e.setMonth(e.getMonth()-Calendar.offset),Calendar.DOM&&(Calendar.DOM.calendarDate.innerHTML=`${Object.values(Calendar.months)[e.getMonth()]} ${e.getFullYear()}`);let n=e.getMonth(),t="";for(let d=1;d<33;d++)if(e.setDate(d),e.getMonth()===n){let n=e.getTime()<a?"past":e.getTime()==a?"today":"futur",r="",l=(e.getTime()/1e3/60/60/24).toFixed(0);l==Calendar.start?r="start":l==Calendar.end?r="end":l>=Calendar.start&&l<=Calendar.end&&(r="ranged"),t+=`<i class="calendar_cell ${n} ${r}" data-inputdate="${e.getFullYear()}-${e.getMonth()<9?`0${e.getMonth()+1}`:e.getMonth()+1}-${e.getUTCDate()}" data-date="${l}">${d}</i>`}return t}}};document.addEventListener("DOMContentLoaded",Calendar.render);