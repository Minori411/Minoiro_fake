require 'faker'

User.create!(name:"林みのり",
            email:"aaa@example.com",
            password:"password1234",
            id:1
            )


Plan.create!(title: "aaa", 
            tag: "aaa",
            can_do: "aaa",
            youtube: "aaa",
            body: "aaa",
            status: "aaa",
            consent: "aaa",
            user_id:1
            )

Review.create!(body: "メンターの方に親切にしていただき、円滑に進めることができました。ありがとうございました。",
                reviewer_id: 1,
                reviewee_id: 2,
                user_id: 1,
                evaluation: 5
            )

