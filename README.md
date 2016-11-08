# FrontApp Engineering test

You are given a small sample of our API response when loading an email conversation.
The goal of this test is to display a list of emails in the `FA_TableViewController`. 

### Issues we are facing

One of the biggest challenge we are facing is to display multiple HTML emails in a scrollview. 
* We do not preload the messages and local store them on the phone like many mail apps do. Because of this we have to fetch messages remotely every time. 
* Other email client usually display one message at a time, and not multiple. This is relatively memory consuming.
* While UIWebview are loading HTML synchronously, the new WKWebview is not, which mean that you have to change the cell height when the HTML is loaded (or each time an image is loaded too). That being said, feel free to use anything you want to display HTML, you are not bound to Apple webviews. 
* A webview is a scrollview too, so we have to limit the scrolling there otherwise we would have nested scrollviews. 

### What you have to do

We are looking to create a simple timeline of messages. The class `FA_TableViewController` is already implementing a few key delegate methods. Please check the `FA_Message` class to see the properties we are exposing.
* If the content_loaded property of a message is true: display the body of a message first
* if the content_loaded property of a message is false: display the blurb. A touch event on the blurb should hide it and display `body` instead. Once a message is expanded, you cannot close it. 
* If you opened a message before (by clicking on the blurb) and scroll away, the cell will be dequeued. When scrolling back, remembering the state of the message would be a good thing (so that you do not display the blurb anymore, but the loaded message instead).
* You can if you want create a message cell subclass, or any file you see fit. 

### What is available to you

We already pre-loaded the list of messages for you from a json flatfile, so you do not need to handle any of the networking aspect. 
The class `FA_Message` already possess all the properties you will need for this exercise. 

The following properties are available to you: 
* content_loaded: Boolean = Whether or not the message is fully loaded or not. When this value is false and the customer wish to see this message, we have to load the message from the server. When the content is not loaded the app will only display the message blurb on a single line. When the blurb is clicked, we can load and display the message.  For the sake of the exercise, the content in `body` and `light_body` will already be loaded so that you do not have to perform any network call.
* body: String = This is the full message, including the quote of previous messages. (we are not interested in the quotes, so we removed them for the exercise).
* blurb: String = The message blurb to isplay when the message is collapsed (when `content_loaded` is false).

### What you shouldn't spend too much time on

While we are interested in how you approach the problem:
* This test is not meant to assess your knowledge of Xcode, so this is why you're given this boiler plate project.
* We are giving simple text email (but with HTML markup). So you will need to display HTML but you shouldn't spend too much time optimizing the presentation of the email itself. (we are not giving you complex HTML with media queries and all).
