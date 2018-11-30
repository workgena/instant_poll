## Iterations:

- Create HTML templates based on https://milligram.io CSS framework

  Pages:

    * GET questions/ID. Show current question
    * PUT questions/ID. Submit answer to a current question.
    * GET questions/ID/answer. Show answers to a current question
    * GET questions/answers. Show all answers to currently active questions

- Remove unused CSS from `main.css`
- Clean <meta> tags
- Build application with Phoenix framework
- Deploy with Gigalixir
- Add GIF images: 1) Admin selects question. 2) User answers question. 3) Answers screen

## Actions
- public
  * Show question

    ```example
    What is your current IDE/Editor?
      [ ] IntelliJ IDEA family (RubyMine, PhpStorm, WebStorm, etc.)
      [ ] Text Mate
      [ ] Sublime Text
      [ ] Atom
      [ ] VS Code
      [ ] Emacs or Vim
      [ ] Other(enter you answer): +----------+
                                   |  Cloud9  |
                                   +----------+
    ```

  * Submit answer
  * Show answers
- admin
  * CRUD poll. Need for grouping questions. Public-side does not know about quiz.
    Each poll consists of questions.
  * CRUD question
    Each question consists of answers.
    Answers can be "radio buttons" or "check boxes".
    Each question has one answer "Other" - input[type=text]. Optional.
  * Show question answers

    ```example
    Question:
      What is your current IDE/Editor?

    <!-- with CSS colored progress bars -->
    Answers:
      80% :: IntelliJ IDEA family (RubyMine, PhpStorm, WebStorm, etc.)
       5% Atom
       5% VS Code
       2% Emacs or Vim
       2% Sublime Text
       1% Text Mate
       5% Other:
        - Gedit
        - Cloud9
        - Nano

    <!-- List of other questions, styling within <div> with horizontal scrolling -->
    Other questions of this poll:
      [What is you current monitor?] | [What is your keyboard?] | [What mouse do you use at work?] |
      [How often do you take brakes?] | [How match do you drikn water?] | [Are you satisfied with your productivity?] |
      [What type of desk do you prefer?]
    ```

  * Activate question
  * Turn Off questioning
  * Archive question


==> Attention! You did not provide a cookie for the erlang distribution protocol in rel/config.exs
For backwards compatibility, the release name will be used as a cookie, which is potentially a security risk!
Please generate a secure cookie and use it with `set cookie: <cookie>` in rel/config.exs.
