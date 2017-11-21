/* eslint no-console: 0 */
// Run this example by adding:
// <%= javascript_pack_tag 'health_vue' %>
// <%= stylesheet_pack_tag 'health_vue' %>

import Vue from 'vue/dist/vue.esm'

// Import and name health component
import Health from '../components/health.vue'
Vue.component('health', Health);

// Import and name health-status component
import HealthStatus from '../components/health-status.vue'
Vue.component('health-status', HealthStatus);

import VueResource from 'vue-resource'

Vue.use(VueResource);

document.addEventListener('DOMContentLoaded', () => {
  const health = new Vue({
    el: '#app',
    data: {
      statuses: []
    }
  })
});
