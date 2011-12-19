Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'Fvy6EbSOUeD3up9VTWMqhA', 'WNZbKOR4MoeAEaLibIVJkkz1DDBmVBhpxLGizUwYfq8'
  #provider :facebook, 'APP_ID', 'APP_SECRET'
  provider :linked_in, '9vmisk52lyn5', 'CWElxQ2qcvWS6XaB'
  
end