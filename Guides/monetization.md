# App Monetization Guide

In this guide, you'll learn everything you need to know about app monetization.

> [!NOTE]
> **TL;DR**
> 
> Show your paywall **as often as possible** (on each app launch, each click on paid feature), **include a banner** to your main screen informing the users that there's a paid plan, try to **not mark any features by "Pro" badge**. Let them click on the button and show the paywall if the user is not subscribed.
>
![Paywall banner](https://i.imgur.com/6DLDX1o.png)

## 1. Types of Monetization

There are several types of monetization strategies that you can employ for your app:

- **Freemium**: Offer a free version of your app with limited features, and provide premium content or features for a price.
- **Subscription**: Charge users a recurring fee to access your app's content or services on a regular basis.
- **One-Time Purchase**: Offer your app for a single upfront fee with all features included.
- **In-App Purchases**: Allow users to buy virtual goods or additional features within your app.
- **Ads**: Display advertisements within your app and earn revenue based on clicks, impressions, or other engagement metrics.

> [!TIP]
> ### Useful tip
> If you consider offering a free tier as well as paid tier with the paid tier having more features, consider this: A number of experiments I did showed that removing a free plan entirely increases a conversion rate slightly. You might want to experiment with your user base and see what works for you. For my app Trading Tracker, I stick with the free plan as well as paid plan.

Each monetization model has its own advantages and considerations, so it's essential to choose the one that aligns best with your app's content, audience, and goals.

> [!IMPORTANT]
> ### You might want to consider:
> - **Frequency of Use**: Evaluate how often users engage with your app and tailor the paywall strategy accordingly. Apps with high usage rates may have more opportunities to implement paywalls.
> - **Recurring Costs**: Assess any ongoing expenses associated with maintaining and running your app, such as server costs or content licensing fees. These costs should be factored into your monetization strategy to ensure profitability. In other words, if you have to pay monthly for something to run the app, go for the subscription based model. One-time payment otherwise.

## 2. When to Show the Paywall

Deciding when to introduce a paywall in your app is crucial for maximizing revenue without alienating users. Consider these factors:

- **As often as possible**: I am a strong advocate of showing your paywall as often as possible without it being too bothering for users. The paywall is what will make your revenue after all.
- **Feature Usage**: Introduce the paywall after users have engaged or tried to engage with key/paid features of your app, demonstrating its usefulness.
- **Value Perception**: Ensure that users understand the value proposition of your app before asking them to pay for it. In other words, make sure the user is well aware of what your app is about after the onboarding.
- **Feedback and Testing**: Test, test and test. Gather feedback from users and conduct A/B tests to determine the optimal timing for implementing the paywall.

> [!TIP]
> Showing paywall on each app launch is what worked the best for me. Don't be scared to show your paywall. Yes, it will be slightly annoying for free tier users but you want to cater to the paying customers anyway. 

## 3. Choosing the Right Price

Setting the right price for your app or in-app purchases can significantly impact its success. What I found out when pricing Trading Tracker is that if you think a price is too high, it's really not. Make it higher. It's very common for indie developers to underprice their products and then leaving lots of money of the table.

 Consider the following factors:

- **Competitive Analysis**: Research similar apps in the market and analyze their pricing strategies.
- **User Segmentation**: Understand who is your target audience and evaluate if and how much they are willing to pay for your app.
- **Experimentation**: Test different price points and monitor user response to find the optimal price for maximizing revenue.

## 4. Maximizing App Profitability

Finally, here are some useful tips to maximize app's profitability:
### General
- Show paywall on each app launch
- Show paywall on each attempt to access a paid feature
- Show banner on your main screen encouraging users to purchase your product
- Track conversion rate analytics

### Paywall specific

> [!CAUTION]
> **Both EULA and Privacy Policy links MUST be visible on your paywall. Otherwise, your app will get rejected by the AppStore Review team.**
> EULA (End User License Agreement) is provided by Apple and in 99% cases this will be enough. You can find the standard EULA [here](https://www.apple.com/legal/internet-services/itunes/dev/stdeula/).
>
> With **Privacy policy** however, you have to write that yourself. Feel free to use [Trading Tracker Privacy policy](https://trading-tracker-de3a4.web.app/) and just use your app's name and other details. I would suggest to create a page in Notion and make it public via URL which you can then use in your app for **Privacy Policy** button.

1. Focus on social proof
  -  Even if you don't have that yet. Ask you friends what they think, write their reviews into your paywall.
  -  You want to get as many user reviews as quickly as possible by requesting the [review where it makes sense](reviews.md).
2. Don't distract users with too many options 
  - Choose one single product you want to sell (e.g. annual subscription) and make the CTA button for that.
3. Show the users how much they'll pay a week for your annual subscription, instead of the full annual price (only for subscriptions).
4. Regarding more options (e.g. monthly, weekly, quarterly subscription or lifetime purchase)
  - Show a small button at the bottom of the paywall.
  - Users that are not willing to pay for annual sub might be willing to pay for monthly or quarterly sub.
5. Should you offer Lifetime option?
  - It depends on your business model. If you have any recurring costs to run the app, you shouldn't. If your app runs on free Firebase plan and you don't have any other costs, you can offer lifetime option. Keep in mind though, by offering lifetime option, you're basically saying that your app will be usable even in 20 years. 

> [!TIP]
> ### Free trials
> 
> If your app's business model is based on subscriptions, choose one subscription plan and offer a free trial. Let's say your main product is an annual subscription. You should offer a 7-day free trial for this subscription.
> 
> Users are more likely to start the subscription if they don't have to pay right away. What might as well happen is that you will get paid for the free trials that were not cancelled and the users have been charged even if they don't use the app anymore. That's something that we cannot do anything about unfortunately. This is how the AppStore works and we can only accept it or even take advantage of it.

By implementing these strategies and considerations effectively, you can optimize app monetization and build a successful and sustainable revenue stream for your app.

---
If you're not sure about your paywall, feel free to drop me a message on [Twitter](https://twitter.com/maros_petrus) with your paywall and I'll take a look!
