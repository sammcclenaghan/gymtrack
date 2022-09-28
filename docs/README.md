# Gym Track

## ERD

```mermaid
  erDiagram
    USER{
        string email
        string encrypted_password
        string reset_password_token
        datetime reset_password_sent_at
        datetime remember_created_at
        datetime created_at
        datetime updated_at

    }
    WORKOUT{
        string name
        datetime starts_at
        datetime created_at
        datetime updated_at
        boolean is_favourited
        integer user_id
    }
    WORKOUT_SET{
        integer workout_exercise_id
        integer set_number
        integer weight
        integer reps
        datetime created_at
        datetime updated_at
    }
    WORKOUT_EXERCISE{
        integer workout_id
        integer exercise_id
        datetime created_at
        datetime updated_at
    }
    EXERCISE{
        string name
        datetime created_at
        datetime updated_at
    }
    
    USER ||--|{ WORKOUT :creates
    WORKOUT }|--|{ WORKOUT_EXERCISE :contains_many
    WORKOUT_EXERCISE }|--|{ EXERCISE :linked_to
    WORKOUT_EXERCISE ||--|{ WORKOUT_SET :has_many
```

## FlowCharts

### User create workout
```mermaid
graph TD
  %%Initialize User and ensure they have an account
  start([Start]) -->|Get User| user_sign_in_check{User is signed in?}
  user_sign_in_check --> |No| sign_in_page(Redirect to sign in page)
  user_sign_in_check --> |Yes| user_home_page(Redirect to User home page)
  user_home_page --> retrieve_workouts(Retrieve all user's workouts from database)

  %%Check database if workout exists
  retrieve_workouts-->check_workout_existence{Workout Exists?}

  %%If Workout exists
  check_workout_existence--> |Yes| update_or_clone_choice{Update Workout or Clone?}
  update_or_clone_choice --> update(Update Workout)
  update --> save_to_database(Save to Database)
  update_or_clone_choice --> clone(Clone Workout)
  clone --> save_to_database

  %%If Workout doesn't exist
  check_workout_existence --> |No| new_workout(New Workout)
  new_workout-->check_title_input(User inputs title?)
  check_title_input-->|Yes|save_to_database
  check_title_input-->|No|error_response[/Send Turbo_Stream error response/]
  ```
