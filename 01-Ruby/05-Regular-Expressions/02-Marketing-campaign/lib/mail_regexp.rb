# Return true if the email is valid, false otherwise
def valid?(email)
  email.match?(/^[a-zA-Z0-9_.+\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-.]+$/)
end

# Return an array with the valid emails only
def clean_database(emails)
  emails.select { |email| valid?(email) }
end

# Return a Hash with emails grouped by TLD
def group_by_tld(emails)
  emails.group_by { |email| email.match(/.(\w+)$/)[1] }
end

# Return a Hash with username, domain and tld extracted from email
def compose_mail(email)
  match_data = email.match(/^(?<name>\w+)@(?<domain>\w+).(?<tld>\w+)$/)
  { username: match_data[:name], domain: match_data[:domain], tld: match_data[:tld] }
end


LOCALES = {
  es: {
    subject: "Nuestro sitio web está en línea",
    body: "Ven a visitarnos!",
    closing: "Nos vemos pronto",
    signature: "El equipo"
  },
  en: {
    subject: "Our website is online",
    body: "Come and visit us!",
    closing: "See you soon",
    signature: "The Team"
  },
  fr: {
    subject: "Notre site est en ligne",
    body: "Venez nous rendre visite !",
    closing: "A bientot",
    signature: "L'équipe"
  },
  de: {
    subject: "Unsere Website ist jetzt online",
    body: "Komm und besuche uns!",
    closing: "Bis bald",
    signature: "Das Team"
  }
}

# Translates a sentence:
# Picks the corresponding translation in LOCALES, given a keyword and a language:
# 1. Dive into the enclosed Hash corresponding to the language (falls back to :en if not found)
# 2. In that language Hash, retrieve the value corresponding to the keyword
def translate(keyword, language)
  translations = if LOCALES[language.to_sym].nil?
                   LOCALES[:en]
                 else
                   LOCALES[language.to_sym]
                 end
  translations[keyword]
end

# Return a Hash with username, domain and tld extracted from email
# translate subject, body, closing and signature, according to TLD
def compose_translated_email(email)
  # Extract information from the email with capture groups
  match_data = email.match(/^(?<name>\w+)@(?<domain>\w+).(?<tld>\w+)$/)

  # Compose the returned hash
  {
    username: match_data[:name],
    domain: match_data[:domain],
    tld: match_data[:tld],
    subject: translate(:subject, match_data[:tld]),
    body: translate(:body, match_data[:tld]),
    closing: translate(:closing, match_data[:tld]),
    signature: translate(:signature, match_data[:tld])
  }
end
