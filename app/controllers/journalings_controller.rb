class JournalingsController < ApplicationController

    wrap_parameters :journaling, include: [:title, :text, :journalId]

    def createNewJournalEntry
        byebug
        user = get_current_user
        journal = Journaling.new(title: new_journal_params[:title], text: new_journal_params[:text], user_id: user.id)

        if journal.save 
            render json: { title: journal.title }, status: :created
        else
            render json: { journal_errors: journal.errors.full_messages }, status: :unprocessable_entity
        end 
    end

    def deleteJournalEntry
        journal = Journaling.find_by(id: delete_params[:journalId])
        if journal 
            journal.destroy
            render json: {}, status: 200
        else
            render json: { error: 'Error deleteing entry'  }, status: :unprocessable_entity
        end
    end

    private

    def new_journal_params
        params.require(:journaling).permit(:title, :text)
    end


    def delete_params
        params.require(:journaling).permit(:journalId)
    end

end
