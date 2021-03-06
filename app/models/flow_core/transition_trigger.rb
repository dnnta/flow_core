# frozen_string_literal: true

module FlowCore
  class TransitionTrigger < FlowCore::ApplicationRecord
    self.table_name = "flow_core_transition_triggers"

    belongs_to :workflow, class_name: "FlowCore::Workflow"
    belongs_to :transition, class_name: "FlowCore::Transition"

    before_validation do
      self.workflow ||= transition&.workflow
    end

    def configurable?
      false
    end

    def type_key
      self.class.to_s.split("::").last.underscore
    end

    include FlowCore::TransitionTriggerable
  end
end
