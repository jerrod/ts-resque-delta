# A simple job class that processes a given index.
#
class ThinkingSphinx::Deltas::ResqueDelta::DeltaJob
  @queue = :ts_delta

  # Runs Sphinx's indexer tool to process the index. Currently assumes Sphinx
  # is running.
  #
  # @param [String] index the name of the Sphinx index
  #
  def self.perform(index)
    ThinkingSphinx::Deltas::ResqueDelta.before_index(index)
    unless ThinkingSphinx::Deltas::IndexJob.new(index).perform
      ThinkingSphinx::Deltas::ResqueDelta.failed_index(index)
    end
    ThinkingSphinx::Deltas::ResqueDelta.after_index(index)
  end
end
