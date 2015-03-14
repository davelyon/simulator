# simulator - simctl beautifier

Xcode 6 ships with a nifty little utility called `simctl` that allows easy management of simulators. It even lets you give them nice, readable names like "iOS7 iPad" when creating them! It does *not* however, let you reference them by those names for other commands. This means that scripting is hard because you must know or parse out the identifier for the simulator you want to target, instead of being able to refer to it by a consistent name. `simulator` wraps simctl and extends it just a bit to make it easier to work with.

# Use cases

Originally inspired by trying to create a test script that every dev could run without modifying. In order to do that with `simctl`, you'd need to know the UDID which would be different on each machine.

For the original case, I scripted creating 2 simulators ZTestsimulator81, ZTestSimulator71, to run tests cleanly from the command line without running the risk of clearing a developers current development data. 

I created this wrapper after realizing that identifying and managing simulators by name would make any scripting task easier.
 
# Install

## Homebrew

```sh
brew tap davelyon/tap
brew install simulator
```

## Other Options

Open to suggestions, but possibly the easiest is just to clone the repo and ensure that the directory ends up in your PATH

# Examples:

``` sh
simulator create "My Test Simulator" iPhone-5s iOS-8-2 
# A9F00BFD-66D5-4E78-8E18-C08DC3772C28

simulator list
# == Devices ==
# -- iOS 8.2 --
# iPhone 4s           	 (4183E129-01F2-47C4-941C-E7DE6AB69F5F) (Shutdown)
# iPhone 5            	 (9547A985-3409-48B0-94AF-2C9639DE76ED) (Shutdown)
# iPhone 5s           	 (BEC8FB3E-475D-49DC-9119-3CF007F574E7) (Shutdown)
# My Test Simulator   	 (A9F00BFD-66D5-4E78-8E18-C08DC3772C28) (Shutdown)

simulator reset "My Test Simulator"
simulator destroy "My Test Simulator" 
```
