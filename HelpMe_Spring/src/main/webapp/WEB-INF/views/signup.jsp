<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
   Cascade by Pixelarity
   pixelarity.com | hello@pixelarity.com
   License: pixelarity.com/license
-->
<%-- 
   해야 할 일들
   1. checkId 버튼을 없앤다(ajax로 나오니까) 그리고 checkId 버튼을 눌러야 움직일 수 있도록 하는 기능을 삭제한다.
   2. 약관 동의를 해야 넘어갈 수 있도록 강제
   3. VerifyPassword가 password와 일치해야 넘어갈 수 있게
 --%>
<html>
<head>
<title>HelpMeSignUp</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/helpme/resources/assets/css/main.css?ver=1" />
<style>

      /*추가*/   
      @media screen and (max-width: 2560px){   
         #back-to-top {
                display: inline-block;
              background-color: #51CCA8;;
              width: 50px;
              height: 50px;
              text-align: center;
              border-radius: 4px;
              position: fixed;
              bottom: 30px;
              right: 30px;
              transition: background-color .3s, 
                opacity .5s, visibility .5s;
              opacity: 0;
              visibility: hidden;
              z-index: 1000;
         }
         #back-to-top::after {
              content: "\f077";
              font-family: FontAwesome;
              font-weight: normal;
              font-style: normal;
              font-size: 2em;
              line-height: 50px;
              color: white;  
         }
         #back-to-top:hover {
              cursor: pointer;
              background-color: #333;
         }
         #back-to-top:active {
              background-color: #555;
         }
         #back-to-top.show {
              opacity: 1;
              visibility: visible;
         }
      }   
      /*추가*/      
      @media screen and (max-width: 1980px) {
         .logo{
            margin-top: 7px;      
         }
         #message{
            width: 73%
         }
      }
      /*추가*/
      @media screen and (max-width: 1440px) {
         .logo{
            margin-top: 4px;      
         }
         #message{
            width: 77%
         }
      }
      
      @media screen and (max-width: 1024px) {
         #message{
            width: 92%
         }
      }
      
            
      /*추가*/
      @media screen and (max-width: 980px) {
         .logo{
            margin-top: 7px;      
         }
         #message, #signupoLogin{
            width: 90%
         }
         
      }
      /*추가*/      
      @media screen and (max-width: 768px) {
         .logo{
            margin-top: 4px;      
         }
         #message, #signupoLogin{
            width: 87%
         }
      }      
      /*추가*/      
      @media screen and (max-width: 736px) {
         .logo{
            margin-top: -8px;      
         }
         #message, #signupoLogin{
            width: 93%
         }
      }   
      /*추가*/
      @media screen and (max-width: 425px) {
         .logo{
            margin-top: -4px;      
         }
         #message, #signupoLogin{
            width: 90%
         }
         #demo-copy{
            padding-left: 10px;
         }
         #demoLabel{
            padding-left: auto;
         }
      }   
      /*추가*/      
      @media screen and (max-width: 375px) {
         .logo{
            margin-top: -8px;      
         }
         #message, #signupoLogin{
            width: 90%
         }
      }
   
   </style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body class="is-preload">

   <!-- Header -->
   <header id="header">
      <!-- img src로 이미지를 가져온다. -->
      <a class="logo" href="/helpme/home"><img src="/helpme/resources/images/logo11_2.png"/></a>
      <nav>
         <ul>
            <li><a href="#menu">Menu</a></li>
         </ul>
      </nav>
   </header>
   
   <a id="back-to-top" style="text-decoration:none"></a>
   <!-- Menu -->
   <nav id="menu">
      <ul class="links">
            <li><a href="/helpme/signup" class="button primary">Sign Up</a></li>
               <li><a href="/helpme/login" class="button">Log In</a></li>
               <li><a href="/helpme/home">Home</a></li>
               <li><a href="/helpme/login">My Page</a></li>
               <li><a href="${pageContext.request.contextPath}/helper/all.he">Search Helper</a></li>
               <li><a href="${pageContext.request.contextPath}/BoardList.bo?page=1">Helper Review Board</a></li>
      </ul>
   </nav>

   <!-- Main -->
   <section id="main" class="wrapper alt">
      <div class="inner">

         <header class="major">
            <h1>Sign Up</h1>
         </header>
         <input type="button" id="signupoLogin"
            onclick="location.href='/helpme/login'"
            style="display: block; margin: 0 auto; text-algin: center;"
            value="Do you already have your ID?">
         <div class="col-6 col-12-medium" style="text-align: center;">
         <br>
            <span style="color: red; font-weight: bold">*Must fill in</span>
         </div>
         <br>

         <form name="joinForm" id="joinForm" method="post">
            <div class="row gtr-200">
               <div class="col-6 col-12-medium">
                  <!-- first name, checkId, nationality, ID, PW, mobile phone -->
                  <div class="row gtr-uniform">
                     <div class="col-12">
                        <h4>*Name</h4>
                     </div>
                     <%-- 
                     <div class="col-12">
                        <input type="text" name="client_name" id="client_name" value=""
                           placeholder="First Name" />
                     </div>

                     <div class="col-12">
                        <input type="text" name="client_name" id="client_name" value=""
                           placeholder="Last Name" />
                     </div>
                     --%>
                     <div class="col-12">
                        <input type="text" name="client_name" id="client_name" value=""
                           placeholder="Full Name" />
                     </div>

                     <div class="col-12">
                        <h4>Country</h4>
                     </div>

                     <div class="col-12">
                        <select name="client_country" id="client_country">
                           <option value="" selected>- Select Country -</option>
                           <option value="">Afghanistan</option>
                           <option value="">Albania</option>
                           <option value="">Algeria</option>
                           <option value="">American Samoa</option>
                           <option value="">Andorra</option>
                           <option value="">Angola</option>
                           <option value="">Anguilla</option>
                           <option value="">Antarctica</option>
                           <option value="Antigua and Barbuda">Antigua and
                              Barbuda</option>
                           <option value="Argentina">Argentina</option>
                           <option value="Armenia">Armenia</option>
                           <option value="Aruba">Aruba</option>
                           <option value="Australia">Australia</option>
                           <option value="Austria">Austria</option>
                           <option value="Azerbaijan">Azerbaijan</option>
                           <option value="Bahamas">Bahamas</option>
                           <option value="Bahrain">Bahrain</option>
                           <option value="Bangladesh">Bangladesh</option>
                           <option value="Barbados">Barbados</option>
                           <option value="Belarus">Belarus</option>
                           <option value="Belgium">Belgium</option>
                           <option value="Belize">Belize</option>
                           <option value="Benin">Benin</option>
                           <option value="Bermuda">Bermuda</option>
                           <option value="Bhutan">Bhutan</option>
                           <option value="Bolivia">Bolivia</option>
                           <option value="Bosnia and Herzegowina">Bosnia and
                              Herzegowina</option>
                           <option value="Botswana">Botswana</option>
                           <option value="Bouvet Island">Bouvet Island</option>
                           <option value="Brazil">Brazil</option>
                           <option value="British Indian Ocean Territory">British
                              Indian Ocean Territory</option>
                           <option value="Brunei Darussalam">Brunei Darussalam</option>
                           <option value="Bulgaria">Bulgaria</option>
                           <option value="Burkina Faso">Burkina Faso</option>
                           <option value="Burundi">Burundi</option>
                           <option value="Cambodia">Cambodia</option>
                           <option value="Cameroon">Cameroon</option>
                           <option value="Canada">Canada</option>
                           <option value="Cape Verde">Cape Verde</option>
                           <option value="Cayman Islands">Cayman Islands</option>
                           <option value="Central African Republic">Central
                              African Republic</option>
                           <option value="Chad">Chad</option>
                           <option value="Chile">Chile</option>
                           <option value="China">China</option>
                           <option value="Christmas Island">Christmas Island</option>
                           <option value="Cocos Islands">Cocos (Keeling) Islands</option>
                           <option value="Colombia">Colombia</option>
                           <option value="Comoros">Comoros</option>
                           <option value="Congo">Congo</option>
                           <option value="Congo">Congo, the Democratic Republic
                              of the</option>
                           <option value="Cook Islands">Cook Islands</option>
                           <option value="Costa Rica">Costa Rica</option>
                           <option value="Cota D'Ivoire">Cote d'Ivoire</option>
                           <option value="Croatia">Croatia (Hrvatska)</option>
                           <option value="Cuba">Cuba</option>
                           <option value="Cyprus">Cyprus</option>
                           <option value="Czech Republic">Czech Republic</option>
                           <option value="Denmark">Denmark</option>
                           <option value="Djibouti">Djibouti</option>
                           <option value="Dominica">Dominica</option>
                           <option value="Dominican Republic">Dominican Republic</option>
                           <option value="East Timor">East Timor</option>
                           <option value="Ecuador">Ecuador</option>
                           <option value="Egypt">Egypt</option>
                           <option value="El Salvador">El Salvador</option>
                           <option value="Equatorial Guinea">Equatorial Guinea</option>
                           <option value="Eritrea">Eritrea</option>
                           <option value="Estonia">Estonia</option>
                           <option value="Ethiopia">Ethiopia</option>
                           <option value="Falkland Islands">Falkland Islands
                              (Malvinas)</option>
                           <option value="Faroe Islands">Faroe Islands</option>
                           <option value="Fiji">Fiji</option>
                           <option value="Finland">Finland</option>
                           <option value="France">France</option>
                           <option value="France Metropolitan">France,
                              Metropolitan</option>
                           <option value="French Guiana">French Guiana</option>
                           <option value="French Polynesia">French Polynesia</option>
                           <option value="French Southern Territories">French
                              Southern Territories</option>
                           <option value="Gabon">Gabon</option>
                           <option value="Gambia">Gambia</option>
                           <option value="Georgia">Georgia</option>
                           <option value="Germany">Germany</option>
                           <option value="Ghana">Ghana</option>
                           <option value="Gibraltar">Gibraltar</option>
                           <option value="Greece">Greece</option>
                           <option value="Greenland">Greenland</option>
                           <option value="Grenada">Grenada</option>
                           <option value="Guadeloupe">Guadeloupe</option>
                           <option value="Guam">Guam</option>
                           <option value="Guatemala">Guatemala</option>
                           <option value="Guinea">Guinea</option>
                           <option value="Guinea-Bissau">Guinea-Bissau</option>
                           <option value="Guyana">Guyana</option>
                           <option value="Haiti">Haiti</option>
                           <option value="Heard and McDonald Islands">Heard and
                              Mc Donald Islands</option>
                           <option value="Holy See">Holy See (Vatican City State)</option>
                           <option value="Honduras">Honduras</option>
                           <option value="Hong Kong">Hong Kong</option>
                           <option value="Hungary">Hungary</option>
                           <option value="Iceland">Iceland</option>
                           <option value="India">India</option>
                           <option value="Indonesia">Indonesia</option>
                           <option value="Iran">Iran (Islamic Republic of)</option>
                           <option value="Iraq">Iraq</option>
                           <option value="Ireland">Ireland</option>
                           <option value="Israel">Israel</option>
                           <option value="Italy">Italy</option>
                           <option value="Jamaica">Jamaica</option>
                           <option value="Japan">Japan</option>
                           <option value="Jordan">Jordan</option>
                           <option value="Kazakhstan">Kazakhstan</option>
                           <option value="Kenya">Kenya</option>
                           <option value="Kiribati">Kiribati</option>
                           <option value="Democratic People's Republic of Korea">Korea,
                              Democratic People's Republic of</option>
                           <option value="Korea">Korea, Republic of</option>
                           <option value="Kuwait">Kuwait</option>
                           <option value="Kyrgyzstan">Kyrgyzstan</option>
                           <option value="Lao">Lao People's Democratic Republic</option>
                           <option value="Latvia">Latvia</option>
                           <option value="Lebanon">Lebanon</option>
                           <option value="Lesotho">Lesotho</option>
                           <option value="Liberia">Liberia</option>
                           <option value="Libyan Arab Jamahiriya">Libyan Arab
                              Jamahiriya</option>
                           <option value="Liechtenstein">Liechtenstein</option>
                           <option value="Lithuania">Lithuania</option>
                           <option value="Luxembourg">Luxembourg</option>
                           <option value="Macau">Macau</option>
                           <option value="Macedonia">Macedonia, The Former
                              Yugoslav Republic of</option>
                           <option value="Madagascar">Madagascar</option>
                           <option value="Malawi">Malawi</option>
                           <option value="Malaysia">Malaysia</option>
                           <option value="Maldives">Maldives</option>
                           <option value="Mali">Mali</option>
                           <option value="Malta">Malta</option>
                           <option value="Marshall Islands">Marshall Islands</option>
                           <option value="Martinique">Martinique</option>
                           <option value="Mauritania">Mauritania</option>
                           <option value="Mauritius">Mauritius</option>
                           <option value="Mayotte">Mayotte</option>
                           <option value="Mexico">Mexico</option>
                           <option value="Micronesia">Micronesia, Federated
                              States of</option>
                           <option value="Moldova">Moldova, Republic of</option>
                           <option value="Monaco">Monaco</option>
                           <option value="Mongolia">Mongolia</option>
                           <option value="Montserrat">Montserrat</option>
                           <option value="Morocco">Morocco</option>
                           <option value="Mozambique">Mozambique</option>
                           <option value="Myanmar">Myanmar</option>
                           <option value="Namibia">Namibia</option>
                           <option value="Nauru">Nauru</option>
                           <option value="Nepal">Nepal</option>
                           <option value="Netherlands">Netherlands</option>
                           <option value="Netherlands Antilles">Netherlands
                              Antilles</option>
                           <option value="New Caledonia">New Caledonia</option>
                           <option value="New Zealand">New Zealand</option>
                           <option value="Nicaragua">Nicaragua</option>
                           <option value="Niger">Niger</option>
                           <option value="Nigeria">Nigeria</option>
                           <option value="Niue">Niue</option>
                           <option value="Norfolk Island">Norfolk Island</option>
                           <option value="Northern Mariana Islands">Northern
                              Mariana Islands</option>
                           <option value="Norway">Norway</option>
                           <option value="Oman">Oman</option>
                           <option value="Pakistan">Pakistan</option>
                           <option value="Palau">Palau</option>
                           <option value="Panama">Panama</option>
                           <option value="Papua New Guinea">Papua New Guinea</option>
                           <option value="Paraguay">Paraguay</option>
                           <option value="Peru">Peru</option>
                           <option value="Philippines">Philippines</option>
                           <option value="Pitcairn">Pitcairn</option>
                           <option value="Poland">Poland</option>
                           <option value="Portugal">Portugal</option>
                           <option value="Puerto Rico">Puerto Rico</option>
                           <option value="Qatar">Qatar</option>
                           <option value="Reunion">Reunion</option>
                           <option value="Romania">Romania</option>
                           <option value="Russia">Russian Federation</option>
                           <option value="Rwanda">Rwanda</option>
                           <option value="Saint Kitts and Nevis">Saint Kitts and
                              Nevis</option>
                           <option value="Saint LUCIA">Saint LUCIA</option>
                           <option value="Saint Vincent">Saint Vincent and the
                              Grenadines</option>
                           <option value="Samoa">Samoa</option>
                           <option value="San Marino">San Marino</option>
                           <option value="Sao Tome and Principe">Sao Tome and
                              Principe</option>
                           <option value="Saudi Arabia">Saudi Arabia</option>
                           <option value="Senegal">Senegal</option>
                           <option value="Seychelles">Seychelles</option>
                           <option value="Sierra">Sierra Leone</option>
                           <option value="Singapore">Singapore</option>
                           <option value="Slovakia">Slovakia (Slovak Republic)</option>
                           <option value="Slovenia">Slovenia</option>
                           <option value="Solomon Islands">Solomon Islands</option>
                           <option value="Somalia">Somalia</option>
                           <option value="South Africa">South Africa</option>
                           <option value="South Georgia">South Georgia and the
                              South Sandwich Islands</option>
                           <option value="Span">Spain</option>
                           <option value="SriLanka">Sri Lanka</option>
                           <option value="St. Helena">St. Helena</option>
                           <option value="St. Pierre and Miguelon">St. Pierre and
                              Miquelon</option>
                           <option value="Sudan">Sudan</option>
                           <option value="Suriname">Suriname</option>
                           <option value="Svalbard">Svalbard and Jan Mayen
                              Islands</option>
                           <option value="Swaziland">Swaziland</option>
                           <option value="Sweden">Sweden</option>
                           <option value="Switzerland">Switzerland</option>
                           <option value="Syria">Syrian Arab Republic</option>
                           <option value="Taiwan">Taiwan, Province of China</option>
                           <option value="Tajikistan">Tajikistan</option>
                           <option value="Tanzania">Tanzania, United Republic of</option>
                           <option value="Thailand">Thailand</option>
                           <option value="Togo">Togo</option>
                           <option value="Tokelau">Tokelau</option>
                           <option value="Tonga">Tonga</option>
                           <option value="Trinidad and Tobago">Trinidad and
                              Tobago</option>
                           <option value="Tunisia">Tunisia</option>
                           <option value="Turkey">Turkey</option>
                           <option value="Turkmenistan">Turkmenistan</option>
                           <option value="Turks and Caicos">Turks and Caicos
                              Islands</option>
                           <option value="Tuvalu">Tuvalu</option>
                           <option value="Uganda">Uganda</option>
                           <option value="Ukraine">Ukraine</option>
                           <option value="United Arab Emirates">United Arab
                              Emirates</option>
                           <option value="United Kingdom">United Kingdom</option>
                           <option value="United States">United States</option>
                           <option value="United States Minor Outlying Islands">United
                              States Minor Outlying Islands</option>
                           <option value="Uruguay">Uruguay</option>
                           <option value="Uzbekistan">Uzbekistan</option>
                           <option value="Vanuatu">Vanuatu</option>
                           <option value="Venezuela">Venezuela</option>
                           <option value="Vietnam">Viet Nam</option>
                           <option value="Virgin Islands (British)">Virgin
                              Islands (British)</option>
                           <option value="Virgin Islands (U.S)">Virgin Islands
                              (U.S.)</option>
                           <option value="Wallis and Futana Islands">Wallis and
                              Futuna Islands</option>
                           <option value="Western Sahara">Western Sahara</option>
                           <option value="Yemen">Yemen</option>
                           <option value="Serbia">Serbia</option>
                           <option value="Zambia">Zambia</option>
                           <option value="Zimbabwe">Zimbabwe</option>
                        </select>
                     </div>

                     <div class="col-12">
                        <h4>*Mobile Phone</h4>
                     </div>

                     <div class="col-12">
                        <input type="text" name="client_phone_number"
                           id="client_phone_number" value="" placeholder="XXX-XXXX-XXXX" />
                     </div>

                     <div class="col-12">
                        <h4 style="width: 29%; float: left; margin-top: 8px;">Address</h4>
                        <input type="button" name="searchAddress" id="searchAddress"
                           value="Search your Address" onclick="goPopup()"
                           style="width: 270px;" />
                     </div>

                     <div id="callBackDiv" class="col-12">
                        <input type="text" style="" id="roadFullAddr"
                           name="roadFullAddr" readonly="readonly" />
                     </div>


                     <%-- 
                     <div class="col-12">
                        <input type="text" name="address" id="address" value=""
                           placeholder="Please search your address." />
                     </div>
                     <div class="col-12">
                        <input type="text" name="exactAddress" id="exactAddress" value=""
                           placeholder="Please input your specific address." />
                     </div>
                     --%>


                  </div>

               </div>

               <div class="col-6 col-12-medium">

                  <!-- last name, blank, blank, email, verify PW -->
                  <div class="col-12">
                     <h4>*ID</h4>
                  </div>
                  <div class="col-12">
                     <input type="text" name="client_id" id="client_id" value=""
                        placeholder="ID" />
                     <p id="idCheck_text"></p>
                  </div>

                  <ul class="actions">
                     <!-- 
                     <li><a href="javascript:checkId()" class="button">check   id</a></li>
                      -->
                  </ul>

                  <div class="col-12">
                     <h4>*PW</h4>
                  </div>
                  <div class="col-12">
                     <input type="password" name="client_password"
                        id="client_password" value="" placeholder="PW" />
                  </div>
                  <br>
                  <div class="col-12">
                     <input type="password" name="verify_client_password"
                        id="verify_client_password" value="" placeholder="Verify PW" />
                  </div>
                  <br>
                  <div class="col-12">
                     <h4>*Email</h4>
                  </div>
                  <div class="col-12">
                     <input type="text" name="client_email" id="client_email" value=""
                        placeholder="email" />
                  </div>
               </div>
            </div>


         </form>
      </div>
      <!-- 이용약관, finish -->
      <br>
      <div>
         <div class="col-12">
            <textarea name="message" id="message"
               style="resize: none; display: block; margin: 0 auto;"
               rows="10" readonly>
Please read these Terms carefully. Access to, and use of Usabilla products (“Products”), Usabilla services (“Services”), and the Usabilla website https://app.usabilla.com/ (“Website”), including any of its content, is conditional on your agreement to these Terms. You must read, agree with, and accept all of the terms and conditions contained in these Terms. By creating an account, or by using or visiting our Website, you are bound to these Terms and you indicate your continued acceptance of these Terms.
1. Your Usabilla Account
If you create an account on the Website, you are responsible for maintaining the security of your account, and you are fully responsible for all activities that occur under the account and any other actions taken in connection with the account. You agree to provide and maintain accurate, current and complete information, including your contact information for notices and other communications from us and your payment information. You may not use false or misleading information in connection to your account, or trade on the name or reputation of others, and Usabilla may change or remove any information that it considers inappropriate or unlawful, or otherwise likely to expose Usabilla to claims of third parties. You agree that we may take steps to verify the accuracy of information you have provided to us.
You are responsible for taking reasonable steps to maintain the confidentiality of your username and password. You must immediately notify Usabilla of any unauthorized uses of your information, your account or any other security breaches. Usabilla will not be liable for any acts or omissions by you, including any damages of any kind incurred as a result of such acts or omissions.
2. Responsibility of Users of the Website, Products, and/or Services
Your access to, and all of your use of the Website, Products, and/or Services must be lawful and must be in compliance with these Terms, and any other agreement between you and Usabilla.
When accessing or using the Website, Products, and/or Services, you must behave in a civil and respectful manner at all times. We specifically prohibit any use of the Website, Products, and/or Services, and you agree not to use the Website, for any of the following:
• Engaging in conduct that would constitute a criminal offense, giving rise to civil liability or otherwise violate any city, state, national or international law or regulation that would fail to comply with accepted internet protocol;
• Communicating, transmitting, or posting material that is copyrighted or otherwise owned by a third party unless you are the copyright owner or have the permission of the owner to post it;
• Communicating, transmitting, or posting material that reveals trade secrets, unless you own them or have the permission of the owner;
• Communicating, transmitting, or posting material that infringes on any other intellectual property, privacy or publicity right of another;
• Attempting to interfere in any way with the Website, or our networks or network security, or attempting to use our Website to gain unauthorized access to any other computer system;
• Accessing data not intended for you, or logging on to a server or account, which you are not authorized to access;
• Attempting to probe, scan or test the vulnerability of a system or network or to breach security or authentication measures without proper authorization (or succeeding in such an attempt);
• Attempting to interfere or interfering with the operation of the Website, Products, and/or Services, or our provision of Services to any other users of the Website, our hosting provider or our network, including, without limitation, via means of submitting a virus to the Website, overloading, “flooding”, “mail bombing” or “crashing” the Website.
In addition, if you operate an account, contribute to an account, post material to the Website, post links on the Website, or otherwise make material available by means of the Website (any such material, "Content"), you are solely responsible for the content of, and any harm and damages resulting from that Content. That is the case regardless of whether the Content in question constitutes text, graphics, an audio file, or computer software. By making Content available, you represent and warrant that:
• the downloading, copying and use of the Content will not infringe the proprietary rights, including but not limited to the copyright, patent, trademark or trade secret rights, of any third party;
• if your employer has rights to intellectual property you create, you have either (i) received written permission from your employer to post or make available the Content, including but not limited to any software, or (ii) secured from your employer a written waiver as to all rights in or to the Content;
• you have fully complied with any third party licenses relating to the Content, and have done all things necessary to successfully pass through to end users any required terms;
• the Content does not contain or install any viruses, worms, malware, Trojan horses or other harmful or destructive content;
• the Content is not spam, and does not contain unethical or unwanted commercial content designed to drive traffic to third party sites or boost the search engine rankings of third party sites, or to further unethical or unlawful acts (such as phishing) or mislead recipients as to the source of the material (such as spoofing);
• the Content is not obscene, libelous, hateful or racially or ethnically objectionable, and does not violate the privacy or publicity rights of any third party.
If you delete Content, Usabilla will use reasonable efforts to remove it from the Website and our servers, but you acknowledge that caching or references to the Content may not be made unavailable to the public immediately.
You are responsible for taking precautions as necessary to protect yourself and your computer systems from viruses, worms, Trojan horses, and other harmful or destructive content. Usabilla shall take reasonable precautions to prevent the transmission of harmful content from its technology systems to your technology systems.
Usabilla disclaims any liability for any harm or damages resulting from your access or use of the Website, Products, and/or Services, or access or use of non-Usabilla websites.
Usabilla has the right (though not the obligation) to (i) refuse or remove any Content that, in Usabilla’s reasonable opinion, violates any Usabilla policy or is in any way harmful or objectionable, or (ii) terminates or denies access to and use of the Website, Products, and/or Services, to any person for any reason, in Usabilla’s sole discretion.
3. Fees and Payments
By purchasing Products and/or Services, you agree to pay Usabilla annual subscription fees indicated for such Product or Service. Payments will be due as of the first day you sign up for a Product and/or Services, and will cover an annual period, as indicated when signing up.
Configurations and prices of the Website, Products, and/or Services are subject to change at any time, and Usabilla shall at all times be entitled to modify configurations, fees, prices and quotations, provided that no price changes shall be made applicable to you during a subscription term, and shall only take effect after Usabilla and you have agreed upon an extension, upgrade or renewal of the subscription term. You agree to any such changes if you do not object in writing to Usabilla within seven (7) business days of receiving a notice of Usabilla, or an invoice, incorporating or announcing the fee and/or price changes. All prices are exclusive of, and you shall pay all taxes, duties, levies or fees, or other similar charges imposed on Usabilla or yourself by any taxing authority (other than taxes imposed on Usabilla’s income), related to your order, unless you have provided Usabilla with an appropriate resale or exemption certificate for the delivery location, which is the location where the Products and/or Services are used or performed. In case of changes in law such that a tax is levied that is or becomes irrecoverable with a consequent increase to the costs to Usabilla of delivering the Products and/or Services, whereby and to such an extent Usabilla is entitled to increase its prices accordingly and retroactively.
4. Use of Third Party Content and Materials
Usabilla has not reviewed, and cannot review, all of the material, including computer software, posted to the Website, and cannot therefore be responsible for that material’s content, use or effects. By operating the Website, Usabilla does not represent or imply that it endorses the material there posted, or that it believes such material to be accurate, useful or non-harmful. The Website may contain content that is offensive, indecent, or otherwise objectionable, as well as content containing technical inaccuracies, typographical mistakes, and other errors. The Website may also contain material that violates the privacy or publicity rights, or infringes the intellectual property and other proprietary rights, of third parties, or the downloading, copying or use of which is subject to additional terms and conditions, stated or unstated. Usabilla disclaims any responsibility for any harm and/or damages resulting from the use or downloading of postings of other parties on the website.
5. Content Posted on Other Websites
We have not reviewed, and cannot review, all of the material, including computer software, made available through the websites and webpages to which Usabilla.com links, and that link to Usabilla.com. Usabilla does not have any control over those non-Usabilla websites and webpages, and is not responsible for their contents or their use. By linking to a non-Usabilla website or webpage, Usabilla does not represent or imply that it endorses such website or webpage.
6. Copyright Infringement
As Usabilla requires others to respect its intellectual property rights, it respects the intellectual property rights of others. If you believe that material located on or linked to by the Website violates your copyright, you are encouraged to notify Usabilla. Usabilla will, as it is able, respond to all such notices, including as required or appropriate by removing the infringing material or disabling all links to the infringing material. In order to bring infringing material to our attention, you must provide our DMCA Agent with the following information: (a) an electronic or physical signature of the person authorized to act on behalf of the owner of the copyrighted work; (b) an identification of the copyrighted work and the location on the Website of the allegedly infringing work; (c) a written statement that you have a good faith belief that the disputed use is not authorized by the owner, its agent or the law; (d) your name and contact information, including telephone number and email address; and (e) a statement by you that the above information in your notice is accurate and, under penalty of perjury, that you are the copyright owner or authorized to act on the copyright owner’s behalf.
The contact information of our DMCA Agent for notice of claims of U.S. copyright infringement is: Usabilla Inc., attn.: Usabilla DMCA agent, 228 East 45th Street, Suite 9E, New York, NY 10017, + 1-347-694-5321, email: dmca@usabilla.com.
In the case of a user who may infringe or repeatedly infringes upon the copyrights or other intellectual property rights of Usabilla or others, Usabilla may, in its discretion, terminate or deny access to and use of the Website, Products, and/or Services. In the case of such termination, Usabilla will have no obligation to provide a refund of any amounts previously paid to Usabilla to any person in respect of any such termination.
7. Trademarks
Usabilla, the Usabilla logo, and all other trademarks, service marks, graphics and logos used in connection with the Website, Products, and Services, are trademarks or registered trademarks of Usabilla or Usabilla’s licensors. Other trademarks, service marks, graphics and logos used in connection with the Website, Products, and Services, may be the trademarks of other third parties in which case such license is for the exclusive benefit and use of us unless otherwise stated, or may be the property of their respective owners. Your use of the Website grants you no right or license to reproduce or otherwise use any Usabilla or third party trademarks. Likewise, you grant no right or license to reproduce or otherwise use any of your trademarks, service marks, graphics and/or logos, unless expressly authorized by you.
8. Termination
You may terminate your agreement and close your account with Usabilla at any time, effective the last day of your subscription term, by sending an email to support@usabilla.com. Usabilla may terminate its relationship with you, or may terminate or suspend the accessibility to the Website, Products, and/or Services at any time, including the use of any software, (i) if you breach these Terms and/or any other agreement with Usabilla; (ii) if Usabilla reasonably suspects that you are using the Website, Products, and/or Services to breach the law or infringe third party rights; (iii) if Usabilla reasonably suspects that you are trying to unfairly exploit or misuse Usabilla’s policies; (iv) if Usabilla reasonably suspects that you are using the Website, Products, and/or Services fraudulently, or that Products or Services provided to you are being used by a third party fraudulently; (v) if you fail to pay any amounts due to Usabilla; (vi) you violate any applicable law or regulation. Upon termination of your Usabilla account for the above reasons, there will be no refund of fees and you will be denied access to the Website, Products and/or the Services, including all of its data.
Usabilla may terminate any agreement and access to your account, if the Services or any part thereof, are no longer legally available in your jurisdiction, or are no longer commercially viable, at Usabilla’s sole discretion. In case of termination or closing of your account by you because of a material breach by Usabilla, without any default by you, or in case of a force majeure on the side of Usabilla, Usabilla will refund pro rata for the remaining period of your subscription any fees or expenses paid by you.
If you believe that Usabilla has failed to perform or the Services are defective, you must notify Usabilla in writing and allow fourteen (14) days for Usabilla to cure the defect. If Usabilla cures the defect within this cure period, Usabilla will not be in default and cannot be held liable for any damages and/or losses in connection to such default. If Usabilla has not cured the defect within this cure period, you may terminate the subscription with immediate effect, upon written notice to Usabilla.
9. Changes
The configurations and specifications of the Website, including without limitation all content there available, the Products, and the Services may be amended and/or updated from time to time, at the sole discretion of Usabilla. You are bound by any such changes or updates, unless such changes materially diminish the functionality and value of the Website, Products and/or Services.
10. Limitation of Warranties of Usabilla, Its Suppliers and Its Licensors
Usabilla warrants to Usabilla customers of paid products and/or services, provided that such customers have paid all fees due, and are not otherwise defaulting any obligations towards Usabilla, an availability of the Products and/or Services (“uptime”) of ninety-eight percent (98%) per month. If for a reason solely attributable to Usabilla the uptime is not met, Usabilla will credit you as “liquidated damages”, $100 for every day, or part of the day, the Products and/or Services are not accessible in violation with the uptime. You agree that it would be difficult to determine the amount of damages that will be suffered by you if the uptime will not be met. You also agree that the above compensation schedule will result in liquidated damages that bear a reasonable proportion to the probable loss and the amount of your actual loss. The aforementioned liquidated damages shall be the sole and exclusive remedy in the event the uptime has not been met by Usabilla. However, if the Products and/or Services are not available to you for a reason solely attributable to Usabilla for a continuing period of five (5) days or more, you may terminate your agreement in writing with immediate effect, and you may request return of fees paid by you related to the unavailable Products and/or Services, pro-rata the remaining unused term of your agreement.
Usabilla and its licensors make no warranties or representations whatsoever with respect to the Website, Products, and Services, or any linked site or its content, including the content, information and materials on it or the accuracy, completeness, or timeliness of the content, information and materials. We also do not warrant or represent that your access to or use of the Website, Products, and/or Services, or any linked site will be uninterrupted or free of errors or omissions, that defects will be corrected, or that the Website, Products, and/or Services, or any linked site is free of computer viruses or other harmful components. We assume no responsibility, and shall not be liable for any damages to, or viruses that may infect, your computer equipment or other property on account of your use of the Products or Services, or your access to, use of, or browsing of the Website, or your downloading or uploading of any Content from or to the Website. If you are dissatisfied with the Website, your sole remedy is to discontinue using the Website.
No advice, results or information, whether oral or written, obtained by you from Usabilla, or through the Website, shall create any warranty not expressly made herein. Usabilla does not necessarily endorse, support, sanction, encourage or agree with any content or any user content, or any opinion, recommendation, content, link, data or advice expressed or implied therein, and Usabilla expressly disclaims any and all liability in connection with user content and any other content, materials or information available on or through the Website, Products, and/or Services, created or provided by users or other third parties.
Please note that some jurisdictions may not allow the exclusion of implied warranties, so some of the above exclusions may not apply to you. Check your local laws for any restrictions or limitations regarding the exclusion of implied warranties.
11. Limitation of Liability of Usabilla, its Suppliers and its Licensors
Under no circumstances shall any party, its subsidiaries and affiliates, their respective directors, officers, employees or agents, and other representatives, be liable for any indirect, consequential, incidental, special, or punitive damages, including but not limited to lost profits and business interruption, whether in contract or in tort, including negligence, arising in any way from the use of the Website, Products, Services, and/or the Contents thereof, or of any hyperlinked website even if such party is expressly advised of the possibility of such damages. With the exception of damages related to legally proven or admitted intellectual property infringement caused by Products and/or Services as delivered by a party without any third party content, in no event shall a party’s liability exceed the total sums received by Usabilla from you during the twelve (12) month period immediately prior to the date the damages first occurred.
12. Your Representations and Warranties
You represent and warrant that your use of the Website, Products, and/or Services will be in accordance with any agreement between you and Usabilla, the Usabilla Privacy Policy, these Terms, and with any applicable laws and regulations, including without limitation any local laws or regulations in your country, state, city, or other governmental area, regarding online conduct and acceptable content, and including all applicable laws regarding the transmission of technical data exported from the country in which you reside, and with any other applicable policy or terms and conditions.
13. Indemnification
Subject to the limitations set forth herein, the Parties agree to defend, indemnify, and hold each other harmless, including its subsidiaries and affiliates, their respective directors, officers, employees or agents, and other representatives, from and against all claims, losses, damages, liabilities, and costs (including but not limited to reasonable attorneys’ fees and court costs), arising out of, relating to or in connection with (i) a material violation of these Terms, or any agreement between the Parties, or (ii) any allegation that any information or material (including any Content) violates any rights of any third party.
You understand and agree that, by using the Products and/or Services, you are solely responsible for any data, including personally identifiable information, collected or processed via our Products and/or Services. You will defend, indemnify, and hold Usabilla harmless, without any limitation, for all damages in connection to (alleged) violations of any privacy laws through the use of the Products and/or Services under your account.
14. Miscellaneous
Each party shall take out adequate insurance in order to cover its risks hereunder, including but not limited to a general- and product liability insurance. Regarding the security, confidentiality and integrity of data, each party is responsible for maintaining appropriate technical and organizational measures for the protection of data processed on their own systems and on third party systems that are in use by the involved party.
Usabilla will not be liable for any delay in performing or failure to perform any of its obligations to you caused by events beyond its reasonable control. Usabilla will notify you promptly in writing of the reasons for the delay or stoppage (and the likely duration) and will take all reasonable steps to overcome the delay or stoppage.
If you are located in the United States and use or access the Website, Products, and/or Services from the United States, these Terms, the Website, Products, and/or Services and any and all agreements between you and Usabilla shall be governed by and construed in accordance with the laws of the state of New York, without giving effect to the United Nations Convention on the Contracts for the International Sale of Goods. All disputes between you and Usabilla shall be resolved under the International Arbitration Rules of the American Arbitration Association in front of a sole arbitrator. The place of arbitration shall be New York City, New York. The language of the arbitration shall be English. Any award, verdict or settlement issued under such arbitration may be entered by any party for order of enforcement by any court of competent jurisdiction.
If you are located outside the United States and use or access the Website, Products, and/or Services from outside the United States, these Terms, the Website, Products, and/or Services and any and all agreements between you and Usabilla shall be governed by and construed in accordance with the laws of the Netherlands, without giving effect to the United Nations Convention on the Contracts for the International Sale of Goods. All disputes between you and Usabilla shall be exclusively resolved by the Dutch Courts in Amsterdam.
Any cause of action against a party, regardless whether in contract, tort or otherwise, must commence within one (1) year after the cause of action accrues. otherwise, such cause of action is permanently barred.
If any part of these Terms is held invalid or unenforceable, that part will be construed to reflect the Parties’ original intent, and the remaining portions will remain in full force and effect. A waiver by either party of any term or condition of these Terms or any breach thereof, in any one instance, will not waive such term or condition or any subsequent breach thereof. You may only assign your rights under these Terms to any party that consents to, and agrees to be bound by, the terms hereof in writing. Usabilla may assign its rights under these Terms at its sole discretion. These Terms will be binding upon and will inure to the benefit of the parties, their successors and permitted assigns. You agree that no joint venture, partnership, employment, or agency relationship exists between you and us as a result of the Terms, or your use of the Website, Products, and/or Services.
A Special Note About Children
The Website is not designed or intended for use by children under the age of 16, and our Products and Services may not be purchased by children under the age of 16. We do not intentionally gather personal information from visitors who are under the age of 16. If you are under the age of 16, you are not permitted to submit any personal information to us. If you are under the age of 16, you should use the Website only with consent of a parent or guardian.
                                                                                 
                              </textarea>
         </div>

         <br>

         <!-- demo-copy 같은 거 나중에 바꿔야 하나? -->
         <form name="acceptTheTerms" id="acceptTheTerms">
         <div class="col-12" style="text-align: center;">
            <input type="checkbox" id="demo-copy" name="agree"> 
            <label for="demo-copy" id="demoLabel"> 
            <span style="color: red; font-weight: bold">[Required]</span>Terms and Conditions and Personal Information Collection / Usage Agreement
            </label>
         </div>
         </form>
         
         
         <div class="col-6 col-12-medium">
            <input type="button" id="finish" onclick="formSubmit()"   style="width: 150px; display: block; margin: 0 auto;" value="Finish">
         </div>
      </div>
   </section>

   <!-- Footer -->
         <footer id="footer">
            <ul class="contact-icons">
               <li class="icon solid fa-map-marker-alt"><a href="https://goo.gl/maps/GaDcdSwpSZn9hRqZ9">Star Building 13F, 12, Teheran-ro 26-gil, Gangnam-gu, Seoul, Republic of Korea 06236</a></li>
               <li class="icon solid fa-phone">(02) 345-9890</li>
               <li class="icon solid fa-envelope">helpme@gmail.com</li>
            </ul>
            <div class="copyright">
               &copy; HelpMe. All rights reserved.
            </div>
         </footer>

   <!-- Scripts -->
   <script src="/helpme/resources/assets/js/jquery.min.js"></script>
   <script src="/helpme/resources/assets/js/jquery.scrolly.min.js"></script>
   <script src="/helpme/resources/assets/js/jquery.scrollex.min.js"></script>
   <script src="/helpme/resources/assets/js/browser.min.js"></script>
   <script src="/helpme/resources/assets/js/breakpoints.min.js"></script>
   <script src="/helpme/resources/assets/js/util.js"></script>
   <script src="/helpme/resources/assets/js/main.js"></script>
   <script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
   <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
   <script src="/helpme/resources/assets/js/signup.js"></script>
   <script>
      function goPopup() {
         // 주소검색을 수행할 팝업 페이지를 호출합니다.
         // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrEngUrl.do)를 호출하게 됩니다.
         var pop = window.open("/helpme/jusoPopup", "pop",
               "width=570,height=420, scrollbars=yes, resizable=yes");
      }
      function jusoCallBack(roadFullAddr) {
         // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
         document.joinForm.roadFullAddr.value = roadFullAddr;

         //         document.form.roadAddr.value = roadAddr;
         //         document.form.addrDetail.value = addrDetail;
         //         document.form.jibunAddr.value = jibunAddr;
         //         document.form.zipNo.value = zipNo;
         //         document.form.admCd.value = admCd;
         //         document.form.rnMgtSn.value = rnMgtSn;
         //         document.form.bdKdcd.value = bdKdcd;
         //         document.form.siNm.value = siNm;
         //         document.form.sggNm.value = sggNm;
         //         document.form.emdNm.value = emdNm;
         //         document.form.liNm.value = liNm;
         //         document.form.rn.value = rn;
         //         document.form.udrtYn.value = udrtYn;
         //         document.form.buldMnnm.value = buldMnnm;
         //         document.form.buldSlno.value = buldSlno;
         //         document.form.mtYn.value = mtYn;
         //         document.form.lnbrMnnm.value = lnbrMnnm;
         //         document.form.lnbrSlno.value = lnbrSlno;
         //         document.form.korAddr.value = korAddr;      
      }
   </script>
   <script>         
         /*추가*/      
         $(function(){
            $('#back-to-top').on('click',function(e){
               e.preventDefault();
               $('html,body').animate({scrollTop:0},600);
            });
                 
            $(window).scroll(function() {
               if ($(document).scrollTop() > 100) {
               $('#back-to-top').addClass('show');
               } else {
               $('#back-to-top').removeClass('show');
               }
            });
         });
      </script>

</body>
</html>