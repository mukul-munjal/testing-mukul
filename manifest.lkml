project_name: "fruit_basket"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }
application: kyorindo-mds {
  label: "kyorindo-mds"
  # file: "bundle.js"
  url: "http://localhost:8080/bundle.js"
  entitlements: {
    local_storage: yes
    navigation: yes
    new_window: yes
    use_form_submit: yes
    use_embeds: yes
    core_api_methods: ["all_connections","search_folders", "run_inline_query", "me", "all_looks", "run_look","query_for_slug","look","run_query"]
    external_api_urls: ["https://as05.jbtob.works/mdsApi","https://as09.jbtob.works/mdsApi"]
    scoped_user_attributes: ["mds_client_id","mds_secret_key","top_dashboard_id","mds_dashboard_id"]
    global_user_attributes: ["locale"]
  }
}

localization_settings: {
  default_locale: en
  localization_level: permissive
}
