config = require 'config'

Twilio = (incoming_sms_cb) ->
  # incoming_sms_cb is a callback function that gets called on every incoming sms

  # Configuration options
  sendsms = (phone_number, message) ->
    phone.sendSms phone_number, message, null, (sms) ->
      sms.on "processed", (reqParams, response) ->
        console.log "Message processed, request params follow"
        console.log reqParams

  TwilioClient = require("twilio").Client
  Twiml = require("twilio").Twiml
  @client = new TwilioClient(config.twilio.sid, config.twilio.auth, config.twilio.hostname)
  @phone = client.getPhoneNumber(config.twilio.phone_number)
  phone.setup phoneNumber.on("incomingSms", (smsParams, response) ->
    # smsParams is the body of Twilio's request
    # response is a Twiml.Response object

    # Call the user specific callback function
    incoming_sms_cb response
  )


# Send a test message to Joe
twilio = new Twilio()
twilio.sendsms config.twilio.phone_number, "Hallo Joe"
