class ThinkingSphinx::Deltas::ResqueDelta::FlagAsDeletedJob
  @queue = :ts_delta

  def self.perform(index, document_id)
    ThinkingSphinx::Deltas::ResqueDelta.before_flag_as_deleted(index, document_id)
    ThinkingSphinx::Deltas::DeleteJob.new(index, document_id).perform
    ThinkingSphinx::Deltas::ResqueDelta.after_flag_as_deleted(index, document_id)
  end
end
