<template>
  <div id="health">
    <div class="container">
      <div class="statuses">
        <h1>Status Page</h1>
        <div v-for="status in statuses">
          <health-status :status="status"></health-status>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  module.exports = {
    data: function() {
      return {
        statuses: []
      }
    },
    methods: {
      getHealth: function () {
        this.$http.get('/health.json').then(function (response) {
          this.statuses = response.data.results;
        }, function (error) {
          console.log(error.statusText);
        });
      }
    },
    mounted: function () {
      this.$nextTick(function () {
        this.getHealth();
      });
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

  .powered a {
    color: #666;
  }
</style>
