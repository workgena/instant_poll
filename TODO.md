# TODO

Step 1 - Manage

* UI: Button "Pull" question - set `active` to `true`; and redirect_back
  - show
  - index
* UI: Button "Stop" finds active question and set `active` to FALSE

Step 2 - Public

* Navigate(of refresh) `poll_page(:id)` displays currently active question
  1) Poll does not have active question: display welcoming text
  2) Poll has active question: display question

Step 3 - Public when question has been answered

* to be continued...

# Plane

- Build application with Phoenix framework
  * mix.new app
  * models
    - polls     name:string archived:boolean
    - questions name:string poll_id  answers:array:string multiple:boolean other_answer:boolean
    - votes     question_id answers:array:string other_answer:string

- Pages:

    * GET questions/ID. Show current question
    * PUT questions/ID. Submit answer to a current question.
    * GET questions/ID/answer. Show answers to a current question
    * GET questions/answers. Show all answers to currently active questions

- Remove unused CSS from `main.css`
- Clean <meta> tags
  * Images:
  * /manage/images/favicon-16x16.png
  * /manage/images/apple-touch-icon.png
- Add video of a poll process, both admin and public screens, in sync
- Hexadecimal representation of Poll ID (convert params[:id] hex to decimal(real ID) on-the-fly)

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
  * CRUD poll. Need for grouping questions.
    Each poll consists of questions.
    Only one question can be active(per poll).
  * CRUD question
    Each question consists of answers.
    Answers can be "radio buttons" or "check boxes".
    Each question has special answer: "Other" input[type=text]. Optional.
  * Show question answers
    - "Pull"-action button
    - Next/Prev links

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
  * Stop poll
  * Archive poll

==> Attention! You did not provide a cookie for the erlang distribution protocol in rel/config.exs
For backwards compatibility, the release name will be used as a cookie, which is potentially a security risk!
Please generate a secure cookie and use it with `set cookie: <cookie>` in rel/config.exs.
