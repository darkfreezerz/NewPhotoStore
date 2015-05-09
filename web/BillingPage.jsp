<%
    /*==================================================================
     PayPal Express Checkout Call
     ===================================================================
     */
%>
<%@include file= "paypalfunctions.jsp" %>
<%  
    String PaymentOption = "Paypal";
 
    
    if (PaymentOption.equals("Paypal")) {
        
        /*
         '------------------------------------
         ' The paymentAmount is the total value of 
         ' the shopping cart, that was set 
         ' earlier in a session variable 
         ' by the shopping cart page
         '------------------------------------
         */
        
        String paymentAmount = request.getParameter("amount");
        session.setAttribute("amount", paymentAmount);

        /*
         '------------------------------------
         ' The currencyCodeType and paymentType 
         ' are set to the selections made on the Integration Assistant 
         '------------------------------------
         */
        String currencyCodeType = "USD";
        String paymentType = "Sale";
        
        /*
         '------------------------------------
         ' The returnURL is the location where buyers return to when a
         ' payment has been succesfully authorized.
         '
         ' This is set to the value entered on the Integration Assistant 
         '------------------------------------
         */
        String returnURL = "http://tomcat.it.kmitl.ac.th:8082/Photo/OrderConfirmPage.jsp";

        /*
         '------------------------------------
         ' The cancelURL is the location buyers are sent to when they hit the
         ' cancel button during authorization of payment during the PayPal flow
         '
         ' This is set to the value entered on the Integration Assistant 
         '------------------------------------
         */
        String cancelURL = "http://tomcat.it.kmitl.ac.th:8082/Photo/Photo/Home.jsp";

        /*
         '------------------------------------
         ' When you integrate this code 
         ' set the variables below with 
         ' shipping address details 
         ' entered by the user on the 
         ' Shipping page.
         '------------------------------------
         */
        String shipToName = "Nipon Sarikan";
        String shipToStreet = "1 Main St";
        String shipToStreet2 = ""; //'Leave it blank if there is no value
        String shipToCity = "San Jose";
        String shipToState = "CA";
        String shipToCountryCode = "US"; //' Please refer to the PayPal country codes in the API documentation
        String shipToZip = "95131";
        String phoneNum = "123";

        /*
         '------------------------------------
         ' Calls the SetExpressCheckout API call
         '
         ' The CallMarkExpressCheckout function is defined in the file PayPalFunctions.asp,
         ' it is included at the top of this file.
         '-------------------------------------------------
         */
         
        HashMap nvp = CallMarkExpressCheckout(paymentAmount, currencyCodeType, paymentType, returnURL, cancelURL,
                shipToName, shipToStreet,  shipToCity, shipToState,
                shipToCountryCode, shipToZip,shipToStreet2, phoneNum,
                session);
        
        
       // HashMap nvp = CallShortcutExpressCheckout (paymentAmount, currencyCodeType, paymentType, returnURL, cancelURL, session);

        String strAck = nvp.get("ACK").toString();
      
         out.print(nvp);  
         out.println(paymentAmount);
        if (strAck != null && (strAck.equalsIgnoreCase("Success") || strAck.equalsIgnoreCase("SuccessWithWarning"))) {
            //' Redirect to paypal.com
          
            RedirectURL(nvp.get("TOKEN").toString(), response);
        } else {
                // Display a user friendly Error on the page using any of the following error information returned by PayPal

            String ErrorCode = nvp.get("L_ERRORCODE0").toString();
            String ErrorShortMsg = nvp.get("L_SHORTMESSAGE0").toString();
            String ErrorLongMsg = nvp.get("L_LONGMESSAGE0").toString();
            String ErrorSeverityCode = nvp.get("L_SEVERITYCODE0").toString();
           
        }
    } 
    else {
        String PaymentProcessorSelected ="PayPal Direct Payment";
        
        
        if (((PaymentOption .equals("Visa") ) || (PaymentOption.equals("MasterCard")) || (PaymentOption .equals("Discover")) || (PaymentOption .equals("AmEx"))) && (PaymentProcessorSelected .equals("PayPal Direct Payment") )) {
             
            /*		
             '------------------------------------
             ' The paymentAmount is the total value of 
             ' the shopping cart, that was set 
             ' earlier in a session variable 
             ' by the shopping cart page
             '------------------------------------
             */
            String paymentAmount = (String) session.getAttribute("Payment_Amount");

            /*
             '------------------------------------
             ' The paymentType that was selected earlier 
             '------------------------------------
             */
            String paymentType = "Sale";

            /*
             ' Set these values based on what was selected by the user on the Billing page Html form
             */
            String creditCardType = PaymentOption; //' Set this to one of the acceptable values (Visa/MasterCard/Amex/Discover) match it to what was selected on your Billing page
            String creditCardNumber = "4222222222222"; // ' Set this to the string entered as the credit card number on the Billing page
            String expDate = "112022"; // ' Set this to the credit card expiry date entered on the Billing page
            String cvv2 = "555"; // ' Set this to the CVV2 string entered on the Billing page 
            String firstName = "Nipon"; // ' Set this to the customer's first name that was entered on the Billing page 
            String lastName = "Sarikan"; // ' Set this to the customer's last name that was entered on the Billing page 
            String street = "1 Main St"; // ' Set this to the customer's street address that was entered on the Billing page 
            String city = "San Jose"; // ' Set this to the customer's city that was entered on the Billing page 
            String state = "CA"; // ' Set this to the customer's state that was entered on the Billing page 
            String zip = "95131"; // ' Set this to the zip code of the customer's address that was entered on the Billing page 
            String countryCode = "US"; // ' Set this to the PayPal code for the Country of the customer's address that was entered on the Billing page 
            String currencyCode = "USD"; // ' Set this to the PayPal code for the Currency used by the customer 
            String IPAddress = request.getRemoteAddr(); // Clients IP Address. Required parameter for this API call

            /*	
             '------------------------------------------------
             ' Calls the DoDirectPayment API call
             '
             ' The DirectPayment function is defined in PayPalFunctions.jsp 
             ' included at the top of this file.
             '-------------------------------------------------
             */
            HashMap nvp = DirectPayment(paymentType, paymentAmount,
                    creditCardType, creditCardNumber, expDate, cvv2,
                    firstName, lastName, street, city, state, zip, countryCode,
                    currencyCode, IPAddress);

            String strAck = nvp.get("ACK").toString();
            
            if (strAck != null || strAck.equalsIgnoreCase("Success") || strAck.equalsIgnoreCase("SuccessWithWarning")) {
                out.println(nvp);
                }
            else{   
                String ErrorCode = nvp.get("L_ERRORCODE0").toString();
                String ErrorShortMsg = nvp.get("L_SHORTMESSAGE0").toString();
                String ErrorLongMsg = nvp.get("L_LONGMESSAGE0").toString();
                String ErrorSeverityCode = nvp.get("L_SEVERITYCODE0").toString();
            }
                
            
            //RedirectURL(nvp.get("TOKEN").toString(), response);
        }
    }
    
%>