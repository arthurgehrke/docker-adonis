"use strict";

const User = use("App/Models/User");

class UserController {
  async store({ request, response }) {
    const userData = request.post();

    try {
      const user = await User.create(userData);

      return response.status(201).json(user);
    } catch (err) {
      return response.status(500).json({ unknownError: err.message });
    }
  }
}

module.exports = UserController;
