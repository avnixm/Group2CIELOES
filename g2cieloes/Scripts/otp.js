function sendOTPSignUp() {
    console.log("OTP Function called");
    const email = document.getElementById('email');
    var OTPlabel = document.getElementById("OTPlabel");
    const otpverify = document.getElementsByClassName('otpverify')[0];
    var otpHiddenField = document.getElementById('otpHiddenField');

    let otp_val = Math.floor(Math.random() * (999999 - 100000 + 1)) + 100000;

    otpHiddenField.value = otp_val;

    let emailbody = `
    <!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="x-apple-disable-message-reformatting">
        <meta name="format-detection" content="telephone=no,address=no,email=no,date=no,url=no">

        <meta name="color-scheme" content="light">
        <meta name="supported-color-schemes" content="light">


        <!--[if !mso]><!-->

          <link rel="preload" as="style" href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&family=Lato:ital,wght@0,400;0,700;1,400;1,700&family=Lato:ital,wght@0,400;0,700;1,400;1,700&family=Lato:ital,wght@0,400;0,700;1,400;1,700&family=Montserrat:ital,wght@0,400;0,700;1,400;1,700&display=swap">
          <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&family=Lato:ital,wght@0,400;0,700;1,400;1,700&family=Lato:ital,wght@0,400;0,700;1,400;1,700&family=Lato:ital,wght@0,400;0,700;1,400;1,700&family=Montserrat:ital,wght@0,400;0,700;1,400;1,700&display=swap">

          <style type="text/css">
          // TODO: fix me!
            @import url(https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&family=Lato:ital,wght@0,400;0,700;1,400;1,700&family=Lato:ital,wght@0,400;0,700;1,400;1,700&family=Lato:ital,wght@0,400;0,700;1,400;1,700&family=Montserrat:ital,wght@0,400;0,700;1,400;1,700&display=swap);
        </style>

        <!--<![endif]-->

        <!--[if mso]>
          <style>
              // TODO: fix me!
              * {
                  font-family: sans-serif !important;
              }
          </style>
        <![endif]-->


        <!-- NOTE: the title is processed in the backend during the campaign dispatch -->
        <title></title>

        <!--[if gte mso 9]>
        <xml>
            <o:OfficeDocumentSettings>
                <o:AllowPNG/>
                <o:PixelsPerInch>96</o:PixelsPerInch>
            </o:OfficeDocumentSettings>
        </xml>
        <![endif]-->

    <style>
        :root {
            color-scheme: light;
            supported-color-schemes: light;
        }

        html,
        body {
            margin: 0 auto !important;
            padding: 0 !important;
            height: 100% !important;
            width: 100% !important;

            overflow-wrap: break-word;
            -ms-word-break: break-all;
            -ms-word-break: break-word;
            word-break: break-all;
            word-break: break-word;
        }



  direction: undefined;
  center,
  #body_table {

  }

  ul, ol {
    padding: 0;
    margin-top: 0;
    margin-bottom: 0;
  }

  li {
    margin-bottom: 0;
  }



  .list-block-list-outside-left li {
    margin-left: 20px !important;
  }

  .list-block-list-outside-right li {
    margin-right: 20px !important;
  }


    .paragraph {
      font-size: 15px;
      font-family: Open Sans, sans-serif;
      font-weight: normal;
      font-style: normal;
      text-align: start;
      line-height: 1;
      text-decoration: none;
      color: #5f5f5f;

    }


    .heading1 {
      font-size: 32px;
      font-family: Open Sans, sans-serif;
      font-weight: normal;
      font-style: normal;
      text-align: start;
      line-height: 1;
      text-decoration: none;
      color: #000000;

    }


    .heading2 {
      font-size: 26px;
      font-family: Open Sans, sans-serif;
      font-weight: normal;
      font-style: normal;
      text-align: start;
      line-height: 1;
      text-decoration: none;
      color: #000000;

    }


    .heading3 {
      font-size: 19px;
      font-family: Open Sans, sans-serif;
      font-weight: normal;
      font-style: normal;
      text-align: start;
      line-height: 1;
      text-decoration: none;
      color: #000000;

    }


    .list {
      font-size: 15px;
      font-family: Open Sans, sans-serif;
      font-weight: normal;
      font-style: normal;
      text-align: start;
      line-height: 1;
      text-decoration: none;
      color: #5f5f5f;

    }


  p a,
  li a {

  display: inline-block;
    color: #5457FF;
    text-decoration: none;
    font-style: normal;
    font-weight: normal;

  }

  .button-table a {
    text-decoration: none;
    font-style: normal;
    font-weight: normal;
  }

  .paragraph > span {text-decoration: none;}.heading1 > span {text-decoration: none;}.heading2 > span {text-decoration: none;}.heading3 > span {text-decoration: none;}.list > span {text-decoration: none;}


        * {
            -ms-text-size-adjust: 100%;
            -webkit-text-size-adjust: 100%;
        }

        div[style*="margin: 16px 0"] {
            margin: 0 !important;
        }

        #MessageViewBody,
        #MessageWebViewDiv {
            width: 100% !important;
        }

        table {
            border-collapse: collapse;
            border-spacing: 0;
            mso-table-lspace: 0pt !important;
            mso-table-rspace: 0pt !important;
        }
        table:not(.button-table) {
            border-spacing: 0 !important;
            border-collapse: collapse !important;
            table-layout: fixed !important;
            margin: 0 auto !important;
        }

        th {
            font-weight: normal;
        }

        tr td p {
            margin: 0;
        }

        img {
            -ms-interpolation-mode: bicubic;
        }

        a[x-apple-data-detectors],

        .unstyle-auto-detected-links a,
        .aBn {
            border-bottom: 0 !important;
            cursor: default !important;
            color: inherit !important;
            text-decoration: none !important;
            font-size: inherit !important;
            font-family: inherit !important;
            font-weight: inherit !important;
            line-height: inherit !important;
        }

        .im {
            color: inherit !important;
        }

        .a6S {
            display: none !important;
            opacity: 0.01 !important;
        }

        img.g-img+div {
            display: none !important;
        }

        @media only screen and (min-device-width: 320px) and (max-device-width: 374px) {
            u~div .contentMainTable {
                min-width: 320px !important;
            }
        }

        @media only screen and (min-device-width: 375px) and (max-device-width: 413px) {
            u~div .contentMainTable {
                min-width: 375px !important;
            }
        }

        @media only screen and (min-device-width: 414px) {
            u~div .contentMainTable {
                min-width: 414px !important;
            }
        }
    </style>

    <style>
        @media only screen and (max-device-width: 640px) {
            .contentMainTable {
                width: 100% !important;
                margin: auto !important;
            }
            .single-column {
                width: 100% !important;
                margin: auto !important;
            }
            .multi-column {
                width: 100% !important;
                margin: auto !important;
            }
            .imageBlockWrapper {
                width: 100% !important;
                margin: auto !important;
            }
        }
        @media only screen and (max-width: 640px) {
            .contentMainTable {
                width: 100% !important;
                margin: auto !important;
            }
            .single-column {
                width: 100% !important;
                margin: auto !important;
            }
            .multi-column {
                width: 100% !important;
                margin: auto !important;
            }
            .imageBlockWrapper {
                width: 30% !important;
                margin: auto !important;
            }
        }
    </style>
    <style>.link-62d10d6d-b252-49a7-af10-c771dbd58b15-Xzt0XJLlayJkgPI0XyMI5 { color: #36710F !important; } </style>

<!--[if mso | IE]>
    <style>
        .list-block-outlook-outside-left {
            margin-left: -18px;
        }

        .list-block-outlook-outside-right {
            margin-right: -18px;
        }

        a:link, span.MsoHyperlink {
            mso-style-priority:99;

  display: inline-block;
    color: #5457FF;
    text-decoration: none;
    font-style: normal;
    font-weight: normal;

        }
    </style>
<![endif]-->


    </head>

    <body width="100%" style="margin: 0; padding: 0 !important; mso-line-height-rule: exactly; background-color: #423836;">
        <center role="article" aria-roledescription="email" lang="en" style="width: 100%; background-color: #423836;">
            <!--[if mso | IE]>
            <table role="presentation" border="0" cellpadding="0" cellspacing="0" width="100%" id="body_table" style="background-color: #423836;">
            <tbody>
                <tr>
                    <td>
                    <![endif]-->
                        <table align="center" role="presentation" cellspacing="0" cellpadding="0" border="0" width="640" style="margin: auto;" class="contentMainTable">
                            <tr class="wp-block-editor-spacerblock-v1"><td style="background-color:#F5F8F4;line-height:30px;font-size:30px;width:100%;min-width:100%">&nbsp;</td></tr><tr class="wp-block-editor-headingblock-v1"><td valign="top" style="background-color:#f5f8f4;display:block;padding-top:20px;padding-right:20px;padding-bottom:20px;padding-left:20px;text-align:center"><p style="font-family:Courier, sans-serif;text-align:center;line-height:NaNpx;letter-spacing:0;font-size:38px;background-color:#f5f8f4;color:#000000;margin:0;word-break:normal" class="heading1"><span style="color:#79B751"><span style="font-weight: bold" class="bold">CIELOES</span></span></p></td></tr><tr class="wp-block-editor-dividerblock-v1" align="center" valign="top"><td style="padding-top:20px;padding-bottom:20px;padding-left:80px;padding-right:80px;background-color:#F5F8F4"><div style="background:#79B751;font-size:3px;line-height:3px;border:0">&nbsp;</div></td></tr><tr class="wp-block-editor-paragraphblock-v1"><td valign="top" style="padding:32px 50px 32px 50px;background-color:#F5F8F4"><p class="paragraph" style="font-family:Montserrat, sans-serif;text-align:left;direction:ltr;line-height:30.00px;font-size:15px;margin:0;color:#5f5f5f;word-break:normal"><span style="color:#36710f"><span style="font-weight: bold" class="bold">Welcome to CIELOES! </span><br><br>To secure your account, please verify with the OTP provided below:<br><br>OTP:  <span style="font-weight: bold" class="bold"> ${otp_val} </span><br><br>If you haven't registered recently, disregard this email. Your security is our priority. <br> <br>Thanks for choosing CIELOES. Contact our support for any questions. <br> <br>Best, <br>CIELOES Support Team</span></p></td></tr><tr class="wp-block-editor-dividerblock-v1" align="center" valign="top"><td style="padding-top:20px;padding-bottom:20px;padding-left:80px;padding-right:80px;background-color:#F5F8F4"><div style="background:#79B751;font-size:1px;line-height:1px;border:0">&nbsp;</div></td></tr><tr><td valign="top" align="center" style="padding:20px 20px 20px 20px;background-color:#F5F8F4"><p aria-label="Unsubscribe" class="paragraph" style="font-family:Open Sans, sans-serif;text-align:center;line-height:17.25px;font-size:15px;margin:0;color:#5f5f5f;letter-spacing:0;word-break:normal">If you no longer wish to receive mail from us, you can <a class="default-content-unsubscribe" href="{unsubscribe}" data-type="mergefield" data-mergefield-value="unsubscribe" data-mergefield-input-value="" style="color: #5457FF; display: inline-block;">unsubscribe</a>.</p></td></tr><tr class="wp-block-editor-paragraphblock-v1"><td valign="top" style="padding:12px 12px 12px 12px;background-color:#79B751"><p class="paragraph" style="font-family:Open Sans, sans-serif;text-align:center;line-height:11.50px;font-size:10px;margin:0;color:#5f5f5f;word-break:normal"><span style="color:#36710F">Unable to view? Read it <a class="link-62d10d6d-b252-49a7-af10-c771dbd58b15-Xzt0XJLlayJkgPI0XyMI5" href="{view}" data-type="mergefield" data-id="62d10d6d-b252-49a7-af10-c771dbd58b15-Xzt0XJLlayJkgPI0XyMI5" data-filename="" style="color:#36710F !important; display: inline-block;" data-mergefield-value="view" data-mergefield-input-value="">Online</a></span></p></td></tr>
                        </table>
                    <!--[if mso | IE]>
                    </td>
                </tr>
            </tbody>
            </table>
            <![endif]-->
        </center>
    </body>
</html>
    `;

    Email.send({
        SecureToken: "0c55be4d-881e-4eb4-aab3-0ec5e407becc",
        To: email.value,
        From: "cieloes.demo@gmail.com",
        Subject: "One-Time Password (OTP) for CIELOES Account Verification",
        Body: emailbody
    }).then(
        success => {
            if (success) {
                if (OTPlabel) {
                    OTPlabel.style.display = "block";
                }

                otpverify.style.display = "flex";
                const otp_inp = document.getElementById('otptext');
                const otp_btn = document.getElementById('OTPbtn');


                otp_btn.addEventListener('click', () => {
                    if (otp_inp.value == otp_val) {
                        otpverify.style.display = "none";
                        OTPlabel.style.display = "none";
                    } else {
                        alert("Invalid OTP");
                    }
                });

                
            }
        }
    );
}
