/* eslint no-console: 0 */
// Run this example by adding:
// <%= javascript_pack_tag 'health_vue' %>
// <%= stylesheet_pack_tag 'health_vue' %>

import Vue from 'vue/dist/vue.esm'
import Health from '../components/health.vue'

import VueResource from 'vue-resource'

Vue.use(VueResource);

document.addEventListener('DOMContentLoaded', () => {
  const health = new Vue({
    el: '#app',
    data: {
      statuses: []
    },
    components: { Health }
  })
});
