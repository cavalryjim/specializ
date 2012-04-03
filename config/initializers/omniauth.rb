Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'Fvy6EbSOUeD3up9VTWMqhA', 'WNZbKOR4MoeAEaLibIVJkkz1DDBmVBhpxLGizUwYfq8'
  provider :facebook, '372796496068260', '0780657164bc0df95d236435272b2975'
  provider :linked_in, '9vmisk52lyn5', 'CWElxQ2qcvWS6XaB'
  
  # JDavis: Omniauth was redirecting to http instead of https.  
  OmniAuth.config.full_host = 'https://www.specializ.us'
  
end