function Twilio(incoming_sms_cb)
{
  // Configuration options
  this.phone_number = '+PHONE';
  this.sid = 'SID';
  this.auth = 'AUTH';
  this.hostname = 'HOSTNAME';

  var TwilioClient = require('twilio').Client,
      Twiml = require('twilio').Twiml;

  this.client = new TwilioClient(this.sid, this.auth, this.hostname);
  this.phone = client.getPhoneNumber(this.phone_number);

  function sendsms(phone_number, message) {
    phone.sendSms(phone_number, message, null, function(sms) {
      sms.on('processed', function(reqParams, response) {
        console.log('Message processed, request params follow');
        console.log(reqParams);
      });
    });
  }

  phone.setup( phoneNumber.on('incomingSms', function(smsParams, response) {
        // smsParams is the body of Twilio's request
        // response is a Twiml.Response object
        incoming_sms_cb(response);
  });

}

var phone_number = "phonenumber"; // Dont publish this!
var twilio = new Twilio();
twilio.sendsms(phone_number, "Hallo Joe");
