## Contributing to Pet Adoption

We encourage anyone who is interested in contributing to Pet Adoption to do so!  In order to ensure good code quality, there are some guidelines we would like to adhere to when contributing to this project. 

---

### Project Organization
Our repository has two main branches: `master` and `develop`.  `master` is reserved for releases and, as such, only administrators are allowed to merge into master.  All current work is done off the `develop` branch.

### Code for Orlando Members
If you are currently a member of Code for Orlando (ie. you have access to the Code for Orlando Github repo), we ask that you create a branch off of `develop`.  You can do this by using the command `git checkout -b [name-of-branch]`. (Make sure you do this from `develop`).  You can name the branch anything you'd like, but we encourage a GitFlow style branch name: `feature/[what-did-you-work-on]`.  When you are ready to commit, push your changes using the command `git push origin [name-of-branch]` and then submit a pull request.  If you are working on a specific issue (which you should be! :P ), reference the issue number in the pull request.

By following these guidelines, we will be able to perform code reviews on all commits before merging with the `develop` branch!

### Non-Code for Orlando Members
For anyone not currently a member of Code for Orlando, we still encourage you to contribute if you are interested!  (Of course, we strongly encourage you to come to a meetup and meet the rest of us!)  If you would like to contribute, go ahead and fork the repo.  Make your changes and push them to your forked repo.  Then you can submit a pull request on Github.

---

### IMPORTANT NOTE TO CONTRIBUTORS
v1.0 of the Pet Adoption app uses the PetFinder API. As such, an API key is required.  This project does not include an API key by default, so you **will** need to get one.  You can get a free developers API key for PetFinder at https://www.petfinder.com/developers/api-key.  You will need to create a free account in order to get an API key.

Once you have your API key, you will need to create an `apikey.plist` file.  For your convenience, there is a file called `apikey.plist.example` provided.  Simply create a copy of this file, rename it to `apikey.plist`, open it, and enter your API key into the appropriate place.  `apikey.plist` is include in the `.gitignore` file, so you don't need to worry about removing this file before submitting pull requests but please make sure that you don't remove the `apikey.plist.example` file in your PRs.

