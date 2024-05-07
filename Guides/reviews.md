# AppStore Reviews Guide

In this guide, you'll learn how to leverage App Store reviews to improve your app's ranking and user engagement.

> [!NOTE]
> **TL;DR**
> 
> Ask for review right after onboarding to maximize the number of reviews. After some experimentations I found out that the user if more likely to leave a 5-star review if the onboarding was quick and showcased the core features of the app.
>

## 1. Timing Review Requests

### Onboarding Review Prompt
Ask for a review right after onboarding to capitalize on the user's initial positive experience with your app. Although it may seem counterintuitive to ask for a review before the user fully explores the app, a well-crafted onboarding process can showcase core features and leave a positive impression, increasing the likelihood of a favorable review.

> [!NOTE]
> By implementing the review after the onboarding I was able to increase the number of reviews by over 200% in a very short period of time.

### Core Feature Completion Review Prompt
Request a review after the user completes a core feature or achieves a significant milestone within the app. For example, if your app is for habit tracking, prompt the user to review the app after they successfully complete a habit for the day. Implement a condition to prevent multiple review requests within a short timeframe to avoid annoying users.

### Limit Review Requests
For AppleStore apps, you can request review only 3 times every 365 days. Use this opportunity wisely and strategically to maximize the effectiveness of your review requests without overwhelming users.

## 2. Importance of Reviews

### Ranking Impact
App Store reviews play a crucial role in determining app rankings. Higher ratings and positive reviews can improve your app's visibility and attract more downloads.

### User Trust and Engagement
Positive reviews build trust and credibility among potential users, increasing the likelihood of downloads and user engagement. Responding to reviews, both positive and negative, shows that you value user feedback and are committed to improving the app's quality.

### Feedback Loop
Reviews provide valuable insights into user preferences, pain points, and feature requests. Regularly monitor and analyze reviews to identify areas for improvement and inform future updates.

## 3. Best Practices for Encouraging Reviews

### Respond to Reviews
Engage with users by responding to reviews, addressing concerns, and expressing gratitude for positive feedback. This demonstrates your commitment to customer satisfaction and fosters a positive relationship with users.

> [!IMPORTANT]
> ### Important tip
> If you get a 1-star review saying something about the subscription not being cancelled automatically or that the user has been charged because they didn't cancel their free trial, make sure to `Report a concern` for that particular review and **DO NOT REPLY** to the review. Apple might delete this review and by replying to it you might ruin your chance to get rid of this 1-star review that has nothing to do with you.

### Ask for Internal Review First
One of the most common practices is to ask whether a user likes the app or not before asking for an actual AppStore Review. The logic here is simple. Show an alert with a simple `Do you like this app?` question with two buttons `Yes` and `No`. If the user taps `Yes`, then use 

```swift
SKStoreReviewController.requestReview(in:)
```

or for SwiftUI respectively

```swift
@Environment(\.requestReview) private var requestReview

/// Presents the rating and review request view after a two-second delay.
private func presentReview() {
    Task {
        // Delay for two seconds to avoid interrupting the person using the app.
        try await Task.sleep(for: .seconds(2))
        await requestReview()
    }
}
```

And if the user taps `No`, you can just do nothing or the better option would be to trigger some kind of feedback flow where the user can answer why they don't like your app and what could be better. You will save yourself from getting bad reviews to some extent.

> [!CAUTION]
> Do not offer anything in return for a review. For example, don't offer users some special feature to be unlocked if they would leave a 5-star review. It's against AppStore Guidelines and your app would get rejected and might also be removed from the AppStore entirely.