# App Design Guide

In this guide, I'll talk about how I design my apps to not waste time and ship quickly.

### A. Design First Approach
I am a big advocate of this approach. What does it mean? You basically first make a design in Figma/Sketch for every single screen of your app and then code the app. 

**Advantages:**
- You have a clear picture of the app's architecture before you start coding.
- You have the whole design system worked out and can quickly implement it in the code.
- You don't have to waste time thinking about the features, flows and other stuff while coding.
- You can remove/skip some features that are irrelevant for the first MVP version.

**Disadvantages:**
- It takes time to design each screen.
- You might not have the skills to use Figma or other tool and so you would need to learn that first.
- You might quit even before you start coding because you might find out that your idea doesn't make sense 🙃

All in all, you just have to do it once to design the whole app. For next apps you can just reuse the design system you have in place for the first one and keep iterating to get better. 

### B. Code First Approach

The Code First approach, as opposed to the Design First approach, prioritizes rapid development and shipping without the overhead of designing every screen beforehand. In this approach, you dive straight into coding your app without extensive pre-planning in design tools like Figma or Sketch.

> [!TIP]
> We want to focus on the business logic after all. Users don't really care about the color of the button or the look of your dashboard. While design might be important for some app ideas, you will be fine mostly with the default iOS look.

**Advantages:**
- Rapid Prototyping: With the Code First approach, you can quickly prototype your app's functionality and iterate on features without spending time on detailed design work upfront.
- Immediate Implementation: You can start implementing features and logic directly in code, allowing for a more fluid and flexible development process.
- Focus on Functionality: By prioritizing coding over design, you can focus on building core functionalities and refining them based on user feedback and testing.

**Disadvantages:**
- Lack of Visual Clarity: Without a clear design plan, it can be challenging to visualize the final product and ensure consistency in UI/UX across different screens and components.
- Potential Rework: Changes in functionality or user interface may require significant rework of code, leading to inefficiencies and delays in the development process.
- Limited Design Exploration: Skipping the design phase may limit creativity and exploration of different design solutions, potentially resulting in suboptimal user experiences.

While the Code First approach offers speed and agility in development, it's essential to balance rapid prototyping with the need for coherent design and user experience. Consider incorporating design iterations and feedback loops into your development process to ensure the final product meets both functional and aesthetic requirements.



> [!IMPORTANT]
> ### iOS Design System
> Apple has invested significant resources in developing and refining their design guidelines, ensuring consistency, accessibility, and familiarity across the iOS ecosystem. And so you should really focus on using as many native components as possible. 
>
> SwiftReads keeps that in mind and works only with native components like NavigationBar or TabBar to provide the familiar navigation and user experience. 
> Not to say that you shouldn't customize the native components. Feel free to use system colors or even your own colors if needed.
>
> By creating your own custom components you're pretty much wasting too much time and skipping on what iOS provides.
