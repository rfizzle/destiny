<template>
  <div class="status">
    <div class="status-heading">
      <span class="name">{{status.name}}</span>
      <span v-bind:class="isFailing">{{status.status}}</span>
    </div>
    <div class="message">{{status.message}}</div>
  </div>
</template>

<script>
  module.exports = {
    name: 'health-status',
    props: ['status'],
    computed: {
      isFailing: function () {
        return {
          'state': true,
          'state-success': this.status.status && this.status.status === "OK",
          'state-danger': this.status.status && this.status.status !== 'OK'
        }
      }
    }
  }
</script>

<style>
  .status {
    font-size: 14px;
    border-bottom: 1px solid #eee;
    padding: 15px;
  }

  .status:last-child {
    border-bottom: 0px;
  }

  .status .name {
    font-size: 20px;
    margin-right: 20px;
    min-width: 100px;
    font-weight: bold;
    color: #555;
  }

  .status .state {
    font-size: 18px;
    float: right;
    width: 80px;
  }

  .status .state-success {
    color: #45b81d;
  }

  .status .state-danger {
    color: red;
  }

  .status .message {
    color: #666;
  }
</style>
