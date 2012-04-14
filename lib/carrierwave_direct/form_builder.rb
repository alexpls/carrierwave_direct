# encoding: utf-8

module CarrierWaveDirect
  class FormBuilder < ActionView::Helpers::FormBuilder
    def file_field(method, options = {})
      options.merge!(:name => "file")
      
      if object.success_action_redirect
        success_field = hidden_field(:success_action_redirect, :name => "success_action_redirect")
      else
        object.success_action_status ||= 201
        success_field = hidden_field(:success_action_status, :name => "success_action_status")
      end
      
      hidden_field(:key,                             :name => "key") <<
      hidden_field(:aws_access_key_id,               :name => "AWSAccessKeyId") <<
      hidden_field(:acl,                             :name => "acl") <<
      hidden_field(:content_type,                    :name => "Content-Type") <<
      success_field <<
      hidden_field(:policy,                          :name => "policy") <<
      hidden_field(:signature,                       :name => "signature") <<
      super
    end
  end
end

