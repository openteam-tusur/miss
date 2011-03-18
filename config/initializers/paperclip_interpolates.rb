
Paperclip.interpolates :contest_year do |attachment, style|
  attachment.instance.contest.year
end

Paperclip.interpolates :member_slug do |attachment, style|
  attachment.instance.member.slug
end
