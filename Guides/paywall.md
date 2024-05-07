# Paywall Breakdown

Paywall is the most important part of your app when it comes to making money on the AppStore. That's why it needs to be perfect 👌!

## What works for Trading Tracker

In SwiftReads codebase, you'll find a similar paywall to this one:

![Paywall](https://i.imgur.com/HgYDeg3.png)

This is the paywall I use for my app Trading Tracker. This paywall is the main source of my revenue that I can live off of. Let's break down everything that's on this paywall.

### 1. Product
You should clearly say what you're trying to sell. In this case, check the top of the screen. There's my Trading Tracker text logo with `Pro` badge. The user knows what this is about right away.

### 2. Tiers Comparison
In this section, you can list a couple of features and compare their availability for free vs. pro tiers. As you can see, I listed only those features that are available for Pro tier users Which directly indicates that the listed features won't be available for free tier and hence the user can decide whether they want to upgrade or not. In this case, the most important feature is `Importing trades` and that's why it's right at the top. 

You might want to experiment with this section and include some free tier features as well. However, in my opinion, it makes sense to only list Pro tier features because you want to persuade the user that it's worth buying your product because of these features.

### 3. Rating
Rating is very important component on this paywall. What it does is that it tells the user that other people like it. It's a form of social proof that might create an emotion of safety and might encourage the user to continue thinking about buying.

### 4. Reviews
Another form of social proof which again closely shows why people like your app and why the current user should buy this subscription. When choosing reviews for this section, you might want to consider choosing one or two reviews that are not 5-stars, just to show that you're legit and can accept critique.

> [!TIP]
> ### What if I don't have any ratings or reviews yet?
> When you're just starting working on your product, you might not have any reviews, obviously. In this case it's actually pretty simple. Just ask your friends and family, show them the app and ask about their opinion. I wouldn't overthink this and would count my friends' reviews as a regular reviews I can mention in my app. It's up to you after all. Apple does not have any rules in place when it comes to app ratings mentioned in the app.

### 5. Call-To-Action button
On your paywall you should really have just one single CTA. By clicking on this button, the purchase is immidiately triggered and the user is asked to confirm the purchase by the Apple StoreKit framework. The reason for such a simple flow is that you don't want to distract user by giving them more options on the paywall and you want them to subscribe as soon as possible. 

This button should trigger the purchase flow for your main product, e.g. annual subscription with 7-days free trial.

### 6. Price per period
Here's a very important component once again. It serves two purposes. The first one is to inform the user how much they would pay if they'll buy your product. It's also required by Apple Review Guidelines to include some form of price per period on your paywall.

The second purpose is, again, to convince the user to buy. Considering the product you're selling is an annual subscription, you have multiple options for this text:
- Mention price per year
- Mention price per month
- Mention price per week
- Mention price per day

In my case, I offer an annual subscription and the price for this subscription is rather high - about $75-$100 depending on the country of the user. This price might discourage the user to start the purchase. By calculating the price for smaller time period you might actually do the opposite - enourage user to buy. In my case, $1.44 a week is really nothing comparing to how much money people spend of a coffee for example (this is how the user thinks, use it to your advantage).

> [!IMPORTANT]
> ### What about Free trials?
> If you offer free trials you should clearly state that on your paywall.
> For the CTA button, you can change the button title to something like `Start 7-day free trial`
> For the price per period text you can change it to `Try 7-day free trial, then $1.44 / week. Cancel anytime.`
>
> RevenueCat - service used for In-App Purchases, offers a way to check the user is available for the introductory offer (in other words, free trial).
> **This logic for free trials IS INCLUDED in the SwiftReads paywall solution.**

### 7. More options
It's important to give users more options. Not directly on the paywall but with one more click. The buttom `Other options` will open a new sheet from the bottom where the user can select other subscriptions or lifetime purchase. 

![Other options](https://i.imgur.com/RU7Q41D.png)

The flow is again very simple. The user can just click on any of the options and it will trigger the purchase flow with the selected subscription/product. 

> [!TIP]
> The annual subscription has `Most popular` badge next to it to encourage the user to purchase this one because it's the main and most profitable product for us.

You can see in the picture, there's also the annual subscription from the paywall but also other options like monthly or quarterly subscriptions. 

Lifetime offer is also on this screen and you would be surprised how many users would actually rather pay one time than having yet another subscription. There are some things to consider for lifetime offers which are discussed [here](monetization.md).

### 8. Required links
Privacy policy and EULA are required links that have to be on your paywall nice and clear. 

> [!CAUTION]
> EULA (End User License Agreement) is provided by Apple and in 99% cases this will be enough. You can find the standard EULA [here](https://www.apple.com/legal/internet-services/itunes/dev/stdeula/).
>
> With **Privacy policy** however, you have to write that yourself. Feel free to use [Trading Tracker Privacy policy](https://trading-tracker-de3a4.web.app/) and just use your app's name and other details. I would suggest to create a page in Notion and make it public via URL which you can then use in your app for **Privacy Policy** button.

### 9. Restore purchase
Restore purchase is also a required functionality for your paywall. By not providing this button your app will get rejected! Restore purchase serves for users that already purchased the subscription or product and by finishing Restore purchase flow the products and subscriptions should be activated for them. Fortuntately, this flow is entirely handled by RevenueCat and is implemented in SwiftReads so you don't have to really worry about it.

> [!IMPORTANT]
> ### Experimenting with your paywall
> Paywalls are the main source of your revenue. That's why you should spend enough time by studying what's working and what's not working for your audience. 
>
> There are some ways how to run experiments for your paywalls. The most common way is to run A/B tests. With A/B tests, you can show one version of your paywall to some percentage of the userbase and the second version to the rest of the userbase. 
>
> Firebase uses `Remote Config` framework for this which is very easy to implement. RevenueCat also has some form of A/B tests with the offerings you can show on your paywall. Sometimes you might not want to change the paywall visuals but rather change the product you're offering.


---
If you're not sure with your paywall, feel free to reach out to me on [Twitter](https://twitter.com/maros_petrus) and show me your paywall! I will do my best to provide support and help.