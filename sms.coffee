config = require 'config'

class Twilio
  constructor: () ->
    TwilioClient = require("twilio").Client
    Twiml = require("twilio").Twiml
    client = new TwilioClient(config.twilio.sid, config.twilio.auth, config.twilio.hostname)
    @phone = client.getPhoneNumber(config.twilio.phone_number)
  
  # Overwrites the callback function for receiving sms 
  init: (receive_sms_cb) ->
    phone.setup phoneNumber.on("incomingSms", (smsParams, response) ->
      # smsParams is the body of Twilio's request
      # response is a Twiml.Response object

      # Call the user specific callback function
      receive_sms(smsParams.number response)
    )

  # Dummy callback for received text messages. This should be overwritten by the user.
  receive_sms: (phone_number, message) ->
    console.log "Error: You need to implement a callback to receive text messages"

  # Function to send a text message  
  send_sms: (phone_number, message) ->
    @phone.sendSms phone_number, message, null, (sms) ->
      sms.on "processed", (reqParams, response) ->
        console.log "Message processed, request params follow"
        console.log reqParams

# Send a test message to Joe
mytwilio = new Twilio()
console.log "Sending a sms message to Joe"
mytwilio.send_sms(config.twilio.joe_phone_number, "Hallo Joe")
