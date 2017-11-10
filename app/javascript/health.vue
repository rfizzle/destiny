<template>
  <div id="health">
    <div class="container">
      <div class="statuses">
        <h1>Status Page</h1>
        <div v-for="health in healths">
          <div class="status">
            <div class="status-heading">
              <span class="name">{{health.name}}</span>
              <span class="state">{{health.status}}</span>
            </div>
            <div class="message">{{health.message}}</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
  module.exports = {
    data: function() {
      return {
        healths: []
      }
    },
    methods: {
      getHealth: function () {
        this.$http.get('/health.json').then(function (response) {
          console.log(response.data.results);
          this.healths = response.data.results;
        }, function (error) {
          console.log(error.statusText);
        });
      }
    },
    mounted: function () {
      this.getHealth();
    }
  }
</script>
<style>
  body {
    line-height: 2rem;
    font-family: sans, serif;
    font-size: 14px;
    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
    color: #000;
    text-align: center;
  }

  a {
    color: #333;
  }

  .container {
    width: 960px;
    margin: 20px auto;
    text-align: left;
  }

  h1 {
    font-weight: normal;
    line-height: 2.8rem;
    font-size: 30px;
    letter-spacing: -1px;
    text-align: center;
    color: #333;
  }

  .container {
    width: 960px;
    margin: 40px auto;
    overflow: hidden;
  }

  .statuses {
    background: #FFF;
    width: 100%;
    border-radius: 5px;
  }

  .statuses h1 {
    border-radius: 5px 5px 0 0;
    background: #f9f9f9;
    padding: 10px;
    border-bottom: 1px solid #eee;
  }

  .statuses .status {
    font-size: 14px;
    border-bottom: 1px solid #eee;
    padding: 15px;
  }

  .statuses .status:last-child {
    border-bottom: 0px;
  }

  .statuses .name {
    font-size: 20px;
    margin-right: 20px;
    min-width: 100px;
    font-weight: bold;
    color: #555;
  }

  .statuses .state {
    font-size: 14px;
    float: right;
    width: 80px;
    color: #45b81d;
  }

  .statuses .message {
    color: #666;
  }

  .statuses .timestamp {
    width: 130px;
    color: #999;
  }

  .statuses .status-error .state {
    color: red;
  }

  .powered {
    text-align: center;
    margin-top: 10px;
    color: #aaa;
  }

  .powered a {
    color: #666;
  }
</style>