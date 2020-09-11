Parse two level dataset names into two variables libref amd table;                                    
                                                                                                      
Dosubl a more powerfull macro sysfunc command                                                         
                                                                                                      
GitHub                                                                                                
https://tinyurl.com/y4rdfo6f                                                                          
https://github.com/rogerjdeangelis/utl-dosubl-a-more-powerfull-macro-sysfunc-command                  
                                                                                                      
/*                   _                                                                                
(_)_ __  _ __  _   _| |_                                                                              
| | `_ \| `_ \| | | | __|                                                                             
| | | | | |_) | |_| | |_                                                                              
|_|_| |_| .__/ \__,_|\__|                                                                             
        |_|                                                                                           
*/                                                                                                    
                                                                                                      
%let libTbl =                                                                                         
   sd1.alpha                                                                                          
   sd1.beta                                                                                           
   sd1.gamma                                                                                          
   sd1.delta                                                                                          
   sd1.epsilon                                                                                        
   sd2.zeta                                                                                           
   sd2.eta                                                                                            
   sd2.theta                                                                                          
   sd2.iota                                                                                           
   sd2.kappa                                                                                          
;                                                                                                     
                                                                                                      
/*           _               _                                                                        
  ___  _   _| |_ _ __  _   _| |_                                                                      
 / _ \| | | | __| `_ \| | | | __|                                                                     
| (_) | |_| | |_| |_) | |_| | |_                                                                      
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                     
                |_|                                                                                   
*/                                                                                                    
                                                                                                      
WORK.WANT total obs=10                                                                                
                                                                                                      
 LIB    TBL                                                                                           
                                                                                                      
 sd1    alpha                                                                                         
 sd1    beta                                                                                          
 sd1    gamma                                                                                         
 sd1    delta                                                                                         
 sd1    epsilon                                                                                       
 sd2    zeta                                                                                          
 sd2    eta                                                                                           
 sd2    theta                                                                                         
 sd2    iota                                                                                          
 sd2    kappa                                                                                         
/*         _       _   _                                                                              
 ___  ___ | |_   _| |_(_) ___  _ __                                                                   
/ __|/ _ \| | | | | __| |/ _ \| `_ \                                                                  
\__ \ (_) | | |_| | |_| | (_) | | | |                                                                 
|___/\___/|_|\__,_|\__|_|\___/|_| |_|                                                                 
               _       _            _                                                                 
  __ _      __| | __ _| |_ __ _ ___| |_ ___ _ __                                                      
 / _` |    / _` |/ _` | __/ _` / __| __/ _ \ `_ \                                                     
| (_| |_  | (_| | (_| | || (_| \__ \ ||  __/ |_) |                                                    
 \__,_(_)  \__,_|\__,_|\__\__,_|___/\__\___| .__/                                                     
                                           |_|                                                        
*/                                                                                                    
                                                                                                      
data want;                                                                                            
                                                                                                      
  length lst $2000;                                                                                   
  retain lst "%compbl(&libTbl)";                                                                      
                                                                                                      
  length lib $8 tbl $44;                                                                              
                                                                                                      
  do _n_=1 by 2;                                                                                      
                                                                                                      
    lib=scan(lst,_n_,". ");    * two separaters "." and " ";                                          
    tbl=scan(lst,_n_+1,". ");                                                                         
                                                                                                      
    if tbl ne "" then output;                                                                         
    else leave;                                                                                       
                                                                                                      
  end;                                                                                                
                                                                                                      
  keep lib tbl;                                                                                       
                                                                                                      
  stop;                                                                                               
                                                                                                      
run;quit;                                                                                             
                                                                                                      
/*                                __                  _   _                                           
| |__     _ __ ___   __ _  ___   / _|_   _ _ __   ___| |_(_) ___  _ __                                
| `_ \   | `_ ` _ \ / _` |/ __| | |_| | | | `_ \ / __| __| |/ _ \| `_ \                               
| |_) |  | | | | | | (_| | (__  |  _| |_| | | | | (__| |_| | (_) | | | |                              
|_.__(_) |_| |_| |_|\__,_|\___| |_|  \__,_|_| |_|\___|\__|_|\___/|_| |_|                              
                                                                                                      
*/                                                                                                    
                                                                                                      
* More powerfull macro sysfunc function;                                                              
                                                                                                      
%dosubl('                                                                                             
  data want;                                                                                          
    length lst $2000;                                                                                 
    retain lst "%compbl(&libTbl)";                                                                    
                                                                                                      
    lst = tranwrd(lst,"DT","DT.");                                                                    
    put lst=;                                                                                         
    length lib $8 tbl $32;                                                                            
                                                                                                      
    do _n_=1 by 2;                                                                                    
      lib=scan(lst,_n_,". ");                                                                         
      tbl=scan(lst,_n_+1,". ");                                                                       
      put lib= tbl=;                                                                                  
      if tbl ne "" then output;                                                                       
      else leave;                                                                                     
    end;                                                                                              
                                                                                                      
    keep lib tbl;                                                                                     
                                                                                                      
    stop;                                                                                             
                                                                                                      
  run;quit;                                                                                           
');                                                                                                   
                                                                                                      
