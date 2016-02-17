# Browser Calls (Rails)
[![Build
Status](https://travis-ci.org/TwilioDevEd/browser-calls-rails.svg?branch=master)](https://travis-ci.org/TwilioDevEd/browser-calls-rails)

Learn how to use [Twilio Client](https://www.twilio.com/client) to make browser-to-phone and browser-to-browser calls with ease. The unsatisfied customers of the Birchwood Bicycle Polo Co. need your help!

[Read the full tutorial here](https://www.twilio.com/docs/tutorials/walkthrough/browser-calls/ruby/rails)!

## Quickstart

### Create a TwiML App

This project is configured to use a **TwiML App**, which allows us to easily set the voice URLs for all Twilio phone numbers we purchase in this app.

Create a new TwiML app at https://www.twilio.com/user/account/apps/add and use its `Sid` as the `TWIML_APPLICATION_SID` environment variable wherever you run this app.

![Creating a TwiML App](http://howtodocs.s3.amazonaws.com/call-tracking-twiml-app.gif)

See the end of the "Local development" section for details on the exact URL to use in your TwiML app.

Once you have created your TwiML app, configure your Twilio phone number to use it ([instructions here](https://www.twilio.com/help/faq/twilio-client/how-do-i-create-a-twiml-app)). If you don't have a Twilio phone number yet, you can purchase a new number in your [Twilio Account Dashboard](https://www.twilio.com/user/account/phone-numbers/incoming).

### Local development

This project is built using the [Ruby on Rails](http://rubyonrails.org/) web framework. It runs on Ruby 2.2.3.

1. First clone this repository and `cd` into its directory:
   ```
   git clone git@github.com:TwilioDevEd/browser-calls-rails.git

   cd browser-calls-rails
   ```

2. Install the dependencies:
   ```
   bundle
   ```

3. Export the environment variables:
   You can find the `AccountSID` and the `AuthToken` at https://www.twilio.com/user/account/settings.
   ```
   export TWILIO_ACCOUNT_SID=your account sid
   export TWILIO_AUTH_TOKEN=your auth token
   ```

   Also export the SID for the TwiML App you created above:
   ```
   export TWIML_APPLICATION_SID=your twiml app sid
   ```

   Finally, export your Twilio phone number:
   ```
   export TWILIO_PHONE_NUMBER=your twilio phone number
   ```

4. Create database and run migrations:

  _Make sure you have installed [PostgreSQL](http://www.postgresql.org/). If on a Mac, I recommend [Postgres.app](http://postgresapp.com)_

   ```
   rake db:setup
   ```

5. Make sure the tests succeed:
   ```
   rspec
   ```

6. Run the server:
   ```
   rails server
   ```

7. Check it out at [http://localhost:3000](http://localhost:3000)

That's it!

To actually forward incoming calls, your development server will need to be publicly accessible. [We recommend using ngrok to solve this problem](https://www.twilio.com/blog/2015/09/6-awesome-reasons-to-use-ngrok-when-testing-webhooks.html).

Once you have started ngrok, update your TwiML app's voice URL setting to use your ngrok hostname, so it will look something like this:

```
http://<your-ngrok-subdomain>.ngrok.io/call/connect
```

## Meta

* No warranty expressed or implied. Software is as is. Diggity.
* [MIT License](http://www.opensource.org/licenses/mit-license.html)
* Lovingly crafted by Twilio Developer Education.
