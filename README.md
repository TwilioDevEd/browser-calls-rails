<a href="https://www.twilio.com">
  <img src="https://static0.twilio.com/marketing/bundles/marketing/img/logos/wordmark-red.svg" alt="Twilio" width="250" />
</a>

# Browser Calls - Rails

> This repository is now archived and is no longer being maintained. 
> Check out the [JavaScript SDK Quickstarts](https://www.twilio.com/docs/voice/sdks/javascript/get-started) to get started with browser-based calling. 

## About

Learn how to use [Twilio's JavaScript SDK](https://www.twilio.com/docs/voice/sdks/javascript) to make browser-to-phone and browser-to-browser calls with ease. The unsatisfied customers of the Birchwood Bicycle Polo Co. need your help!

## Set up

### Requirements

- [Ruby](https://www.ruby-lang.org/) **2.6.x** version.
- [Sqlite3](https://www.sqlite.org/).
- [Node.js](https://nodejs.org/en/) **10.x** or **12.x** version.

### Twilio Account Settings

This application should give you a ready-made starting point for writing your own application.
Before we begin, we need to collect all the config values we need to run the application:

| Config Value | Description            |
| :----------- | :----------------------|
| TWILIO_ACCOUNT_SID  | Your primary Twilio account identifier - find this [in the Console](https://www.twilio.com/console).|
| TWILIO_PHONE_NUMBER | A Twilio phone number in [E.164 format](https://en.wikipedia.org/wiki/E.164) - you can [get one here](https://www.twilio.com/console/phone-numbers/incoming) |
| TWIML_APPLICATION_SID | The TwiML application with a voice URL configured to access your server running this app - create one [in the console here](https://www.twilio.com/console/voice/twiml/apps) and use its `Sid`. Also, you will need to configure the Voice "REQUEST URL" on the TwiML app once you've got your server up and running. |
| TWILIO_API_KEY / TWILIO_API_SECRET | Your REST API Key information needed to create an [Access Token](https://www.twilio.com/docs/iam/access-tokens) - create [one here](https://www.twilio.com/console/project/api-keys). |

### Create a TwiML App

This project is configured to use a **TwiML App**, which allows us to easily set the voice URLs for all Twilio phone numbers we purchase in this app.

Create a new TwiML app at https://www.twilio.com/console/voice/twiml/apps and use its `Sid` as the `TWIML_APPLICATION_SID` environment variable wherever you run this app.

See the end of the "Local development" section for details on the exact URL to use in your TwiML app.

### Local development

1. First clone this repository and `cd` into it.
   ```
   git clone git@github.com:TwilioDevEd/browser-calls-rails.git
   cd browser-calls-rails
   ```

2. Install the dependencies.

   ```bash
   make install
   ```

3. Copy the sample configuration file and edit it to match your configuration.

   ```bash
   cp .env.example .env
   ```

   See [Twilio Account Settings](#twilio-account-settings) to locate the necessary environment variables.

4. Create database and run migrations.

   ```bash
   make setup-serve
   ```

5. Run the server, will run on port 3000.

   ```bash
   make serve
   ```

6. Expose your application to the wider internet using [ngrok](http://ngrok.com). This step
   is important because the application won't work as expected if you run it through
   localhost.

   ```bash
   ngrok http 3000
   ```

7. Once you have started ngrok, update your [TwiML app's](#create-a-twiml-app) Voice URL setting to use
   your ngrok hostname, so it will look something like this:

   ```
   http://<your-ngrok-subdomain>.ngrok.io/call/connect
   ```

   You can read [this blog post](https://www.twilio.com/blog/2015/09/6-awesome-reasons-to-use-ngrok-when-testing-webhooks.html)
   for more details on how to use ngrok.

8. Everything is setup, now you can open two tabs in the browser to test the application.

   - To create a support ticket go to the `home` page. On this page you could fill some fields and create a ticket or you can call to support:
      [http://localhost:3000](http://localhost:3000)

   - To respond to support tickets go to the `dashboard` page (you should open two windows or tabs). On this page you could call customers and answers phone calls:
      [http://localhost:3000/dashboard](http://localhost:3000/dashboard)


That's it!

### Docker

If you have [Docker](https://www.docker.com/) already installed on your machine, you can use our `docker-compose.yml` to setup your project.

1. Make sure you have the project cloned.
2. Setup the `.env` file as outlined in the [Local Development](#local-development) steps.
3. Run `docker-compose up`.
4. Follow the steps in [Local Development](#local-development) on how to expose your port to Twilio using a tool like ngrok and configure the remaining parts of your application.

### Tests

You can run the tests locally by typing:

```bash
bundle exec rspec
```

## Resources

- The CodeExchange repository can be found [here](https://github.com/twilio-labs/code-exchange/).

## License

[MIT](http://www.opensource.org/licenses/mit-license.html)

## Disclaimer

No warranty expressed or implied. Software is as is.

[twilio]: https://www.twilio.com
