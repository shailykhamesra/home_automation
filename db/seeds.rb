AdminUser.find_or_create_by(first_name: "Signzy", last_name: "company", email:"Signzy@abc.com", username: "Signzyuser", password_digest: BCrypt::Password.create('Signzy'))
