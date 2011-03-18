class Voting < ActiveRecord::Base
  belongs_to :member

  def self.can_vote?(request)
    vote = Voting.where(:remote_ip => request.remote_ip, :remote_proxy => request.env['HTTP_X_FORWARDED_FOR']).last
    return false if vote && (vote.created_at + 24.hour) >= Time.now
    true
  end

  def self.vote(member, request)
    return unless self.can_vote?(request)
    member.votings.create(:remote_ip => request.remote_ip, :remote_proxy => request.env['HTTP_X_FORWARDED_FOR'])
  end
end
