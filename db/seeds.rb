User.create_profile!(
    email: 'minoiro@gmail.com',
    name: 'テスト太郎',
    password: 'foobar',
    image: File.open('./app/assets/images/cats.jpg')
)

User.all.each do |user|
    user.articles.create!(
        title: 'タイトル',
        body: 'テキストテキストテキストテキスト'
        )
end